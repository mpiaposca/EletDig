library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SimAdd8 is
--  Port ( );
end SimAdd8;

architecture Behavioral of SimAdd8 is
component Add8Beh is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end component;

component Add8Struct is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (8 downto 0));
end component;
signal IA :  STD_LOGIC_VECTOR (7 downto 0);
signal IB :  STD_LOGIC_VECTOR (7 downto 0);
signal Icin :  STD_LOGIC;
signal OS1, OS2 :  STD_LOGIC_VECTOR (8 downto 0);
begin
  circ1: Add8Struct port map (IA, IB, Icin, OS1);
  circ2: Add8Beh port map (IA, IB, Icin, OS2);
  process 
  begin
    Icin<='0';
    IA<="00000000";
    IB<=(others=>'0');
    wait for 10ns;
    IA(7)<='1'; -- IA<="10000000"; -128+0
    wait for 10ns;
    IB(7)<='1'; -- IB<="10000000"; -128+(-128)
    wait for 10ns;
    IA<=(others=>'1'); -- 11111111
    IB<=(others=>'1');
    wait for 10ns;
  end process; 
end Behavioral;














