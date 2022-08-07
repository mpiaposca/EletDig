library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity FA is
port(A, B, cin: in STD_LOGIC;
        cout, S: out STD_LOGIC);
end FA;
architecture behav of FA is
begin
  cout<=(A and B) or ((A xor B) and cin);
  S<=A xor B xor cin;
end behav;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Add_nbit is
    generic (n:integer:=8);
    Port ( A : in STD_LOGIC_VECTOR (n-1 downto 0);
           B : in STD_LOGIC_VECTOR (n-1 downto 0);
           cin : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (n downto 0));
end Add_nbit;

architecture Behavioral of Add_nbit is

component FA is
port(A, B, cin: in STD_LOGIC;
        cout, S: out STD_LOGIC);
end component;

signal carry: STD_LOGIC_VECTOR (n+1 downto 0);

begin
  myFOR: for i in 0 to n generate
             myIfM: if i=n generate 
                       FA_M: FA port map (A(n-1), B(n-1),carry(n), carry(n+1),S(n));
             end generate;
             myIfL: if i<n generate
                       FA_L: FA port map (A(i), B(i), carry(i), carry(i+1), S(i));
             end generate;
  end generate;          
  carry(0)<=cin;
end Behavioral;









