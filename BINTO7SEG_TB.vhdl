library ieee;
use ieee.std_logic_1164.all;

entity BINTO7SEG_tb is
end BINTO7SEG_tb;

architecture test of BINTO7SEG_tb is
	component BINTO7SEG
		port
		(
			x:	in	std_logic_vector(3 downto 0);
			SEG:	out	std_logic_vector(7 downto 0);
			en: in	std_logic;
			dp:	in	std_logic
		);
	end component;
	
	signal en, dp : std_logic;
	signal x : std_logic_vector(3 downto 0);
	signal SEG : std_logic_vector(7 downto 0);
begin
	test : BINTO7SEG port map (x => x, SEG => SEG, en => en, dp => dp);
	
	process begin
	
	--0. wylaczone wszystko
	dp <= '0';
	en <= '0';
	x <= "0000";
	wait for 1 ns;
	
	--1. wlacz wyswietlacz (0)
	dp <= '0';
	en <= '1';
	x <= "0000";
	wait for 1 ns;
	
	--2. zero kropka
	dp <= '1';
	en <= '1';
	x <= "0000";
	wait for 1 ns;
	
	--3. 5 bez kropki
	dp <= '0';
	en <= '1';
	x <= "0100";
	wait for 1 ns;
	
	--4. wylaczenie wyswietlacza
	dp <= '0';
	en <= '0';
	x <= "0100";
	wait for 1 ns;
	
	--5. wlaczenie
	dp <= '0';
	en <= '1';
	x <= "0100";
	wait for 1 ns;
	
	--6. literka a kropka
	dp <= '1';
	en <= '1';
	x <= "1100";
	wait for 1 ns;
	
	--7. wszystko zapalone
	dp <= '1';
	en <= '1';
	x <= "1000";
	wait for 1 ns;
	
	--8. zgaszone
	dp <= '1';
	en <= '0';
	x <= "1000";
	wait for 1 ns;
	assert false report "end of test";
	wait;
	
	end process;
end test;
	