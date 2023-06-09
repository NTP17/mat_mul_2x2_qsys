LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY reg32_avamap IS
	PORT (
		clock, resetn : IN STD_LOGIC;
		rd, wr, chipselect : IN STD_LOGIC;
		writedata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
		byteenable : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
		readdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
		Q_export : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END reg32_avamap;
ARCHITECTURE Structure OF reg32_avamap IS
	SIGNAL local_byteenable : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL to_reg, from_reg : STD_LOGIC_VECTOR(31 DOWNTO 0);
	COMPONENT MAT_MUL_2x2
		PORT (
			clock, resetn : IN STD_LOGIC;
			D : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
			byteenable : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
			Q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
BEGIN
	to_reg <= writedata;
	WITH (chipselect AND wr) SELECT local_byteenable <= byteenable WHEN '1', "0000" WHEN OTHERS;
	reg_instance: MAT_MUL_2x2 PORT MAP (clock, resetn, to_reg, local_byteenable, from_reg);
	readdata <= from_reg;
		Q_export <= from_reg;
END Structure;