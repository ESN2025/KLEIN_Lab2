LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY LAB2 IS
	PORT(
		clock, reset : IN std_logic;
		display1_o : OUT std_logic_vector(7 DOWNTO 0);
		display2_o : OUT std_logic_vector(7 DOWNTO 0)
	);
END LAB2;

ARCHITECTURE STRUCTURE OF LAB2 IS

	COMPONENT Lab2_sys IS
		PORT (
			clk_clk               : IN  std_logic                    := 'X'; -- clk
			reset_reset_n         : IN  std_logic                    := 'X'; -- reset_n
			seven_segments_export : OUT std_logic_vector(7 DOWNTO 0)         -- export
		);
	END COMPONENT Lab2_sys;
	
	COMPONENT Display IS
		PORT(
		dsp_i : IN std_logic_vector(3 DOWNTO 0);
		dsp_o : OUT std_logic_vector(7 DOWNTO 0)
	);
	END COMPONENT Display;

		
	--SIGNAL DECLARATION
	signal dataTo7seg : std_logic_vector(7 DOWNTO 0);
	
	--INSTANTIATION AND WIRING	
	BEGIN
		Lab2_sys_inst : Lab2_sys PORT MAP(clock, reset, dataTo7seg) ;
		Display1 : Display PORT MAP(datato7seg(3 DOWNTO 0), display1_o);
		Display2 : Display PORT MAP(datato7seg(7 DOWNTO 4), display2_o);
END STRUCTURE;