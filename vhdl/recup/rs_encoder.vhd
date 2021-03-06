--------------------------------------------------------------------------------
--{{{ Copyright 2010 C. D. Stahl, All rights reserved.
--
--    1. Redistributions of source code must retain the above copyright 
--       notice, this list of conditions and the following disclaimer.
--    
--    2. Redistributions in binary form must reproduce the above copyright 
--       notice, this list of conditions and the following disclaimer in 
--       the documentation and/or other materials provided with the 
--       distribution.
--    
--    THIS SOFTWARE IS PROVIDED BY C. D. STAHL ``AS IS'' AND ANY EXPRESS OR 
--    IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
--    OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
--    IN NO EVENT SHALL C. D. STAHL OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
--    INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES 
--    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR 
--    SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
--    CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT 
--    LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
--    OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF 
--    SUCH DAMAGE.
-- 
--}}}


--------------------------------------------------------------------------------
--{{{ Discription
-- This is a Reed-Solomon encoder.
--
--}}}


--------------------------------------------------------------------------------
--{{{ Includes
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.gf256_pkg.all;
use work.rs_encoder_pkg.all;
--}}}


--------------------------------------------------------------------------------
--{{{ Entity Declaration
entity rs_encoder is
  port(
    -- Output
    Data         : out std_logic_vector(7 downto 0);
    Valid        : out std_logic;
    Last         : out std_logic;

    -- Input
    User_Data    : in  std_logic_vector(7 downto 0);
    User_Valid   : in  std_logic;
    User_Last    : in  std_logic;
    User_Busy    : out std_logic;
    
    -- Infr
    Clk          : in  std_logic;
    Rst          : in  std_logic
    );
end entity;
--}}}


--------------------------------------------------------------------------------
--{{{ Architecture Declaration
architecture rtl of rs_encoder is

  ------------------------------------------------------------------------------ 
  --{{{ Signals
  -- lfsr shift register
  signal lfsr        : gf256_a(15 downto 0);
  signal lfsr_next   : gf256_a(15 downto 0);
  
  signal lfsr_shift  : std_logic := '0';
  signal shift_cnt   : std_logic_vector(3 downto 0) := (others => '0');

  --}}}

begin

  ------------------------------------------------------------------------------
  --{{{ Shift Reg
  p_shift : process (Clk) is
  begin
    if Clk'event and Clk = '1' then
      -- lfsr
      if Rst = '1' then
        for ii in lfsr'high downto 0 loop
          lfsr(ii) <= (others => '0');
        end loop;
      elsif User_Valid = '1' then
        lfsr <= lfsr_next;
      elsif lfsr_shift = '1' then
        for ii in lfsr'high downto 1 loop
          lfsr(ii) <= lfsr(ii-1);
        end loop;
        lfsr(0) <= (others => '0');
      end if;

      -- state
      if Rst = '1' then
        lfsr_shift <= '0';
      elsif User_Valid = '1' and User_Last = '1' then
        lfsr_shift <= '1';
      elsif shift_cnt = (shift_cnt'range => '1') then
        lfsr_shift <= '0';
      end if;

      -- counter
      if User_Valid = '1' and User_Last = '1' then
        shift_cnt <= (others => '0');
      elsif lfsr_shift = '1' then
        shift_cnt <= std_logic_vector(unsigned(shift_cnt) + 1);
      end if;

    end if;
  end process;
  --}}}


  ------------------------------------------------------------------------------
  --{{{ Encoding Logic
  -- the encoding logic was generated by script
  u_logic : component rs_encode_logic
    port map( 
      Lo  => lfsr_next,
      Li  => lfsr,
      Di  => User_Data
      );
  --}}}

  
  ------------------------------------------------------------------------------
  --{{{ Output
  p_out : process (Clk) is
  begin
    if Clk'event and Clk = '1' then
      -- valid mux (burst out the parity)
      if User_Valid = '1' then
        Valid <= '1';
      else
        Valid <= lfsr_shift;
      end if;

      -- data mux
      if lfsr_shift = '0' then
        Data <= User_Data;
      else
        Data <= lfsr(lfsr'high);
      end if;

      -- last generation
      if shift_cnt = (shift_cnt'range => '1') then
        Last <= lfsr_shift;
      else
        Last <= '0';
      end if;
      
    end if;
  end process;
  User_Busy <= lfsr_shift;
  --}}}
  

end architecture;
--}}}


