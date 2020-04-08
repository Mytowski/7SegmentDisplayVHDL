library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BINTO7SEG is
    Port ( x : in	STD_LOGIC_VECTOR(3 downto 0);
           SEG : out	STD_LOGIC_VECTOR(7 downto 0);
           en : in	STD_LOGIC;
           dp : in	STD_LOGIC);
end BINTO7SEG;

architecture Behavioral of BINTO7SEG is

begin
process(x, dp, en)
begin
	if en = '1' then
		 case x is
		 when "0000" => SEG <= "10000000"; -- 0     
		 when "0001" => SEG <= "11110010"; -- 1 
		 when "0010" => SEG <= "01001000"; -- 2 
		 when "0011" => SEG <= "01100000"; -- 3 
		 when "0100" => SEG <= "00110010"; -- 4 
		 when "0101" => SEG <= "00100100"; -- 5 
		 when "0110" => SEG <= "00000100"; -- 6 
		 when "0111" => SEG <= "11110000"; -- 7 
		 when "1000" => SEG <= "00000000"; -- 8     
		 when "1001" => SEG <= "00100000"; -- 9 
		 when "1010" => SEG <= "01000000"; -- a
		 when "1011" => SEG <= "00000110"; -- b
		 when "1100" => SEG <= "10001100"; -- C
		 when "1101" => SEG <= "01000010"; -- d
		 when "1110" => SEG <= "00001100"; -- E
		 when "1111" => SEG <= "00011100"; -- F
		 when others => SEG <= "00000000";
		 end case;
		 
		 if dp = '1' then
		 SEG(7) <= '0';
		 else
		 SEG(7) <= '1';
		 end if;
	 else 
		  SEG <= "11111111";
	 end if;
		  
end process;

end Behavioral;

