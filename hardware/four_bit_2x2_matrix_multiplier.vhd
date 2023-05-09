library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity four_bit_2x2_matrix_multiplier is
	port(
		M1_R1C1,
		M1_R1C2,
		M1_R2C1,
		M1_R2C2,
		M2_R1C1,
		M2_R1C2,
		M2_R2C1,
		M2_R2C2: in  std_logic_vector(3 downto 0);

		MX_R1C1,
		MX_R1C2,
		MX_R2C1,
		MX_R2C2: out std_logic_vector(7 downto 0)
	);
end four_bit_2x2_matrix_multiplier;

architecture behavior of four_bit_2x2_matrix_multiplier is
begin
	MX_R1C1 <= (M1_R1C1*M2_R1C1) + (M1_R1C2*M2_R2C1);
	MX_R1C2 <= (M1_R1C1*M2_R1C2) + (M1_R1C2*M2_R2C2);
	MX_R2C1 <= (M1_R2C1*M2_R1C1) + (M1_R2C2*M2_R2C1);
	MX_R2C2 <= (M1_R2C1*M2_R1C2) + (M1_R2C2*M2_R2C2);
end behavior;