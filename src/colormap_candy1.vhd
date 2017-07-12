
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity colormap_candy1 is
   port(
      clk: in std_logic;
      addr: in std_logic_vector(7 downto 0);
      data: out std_logic_vector(11 downto 0)
   );
end colormap_candy1;

architecture arch of colormap_candy1 is
   constant ADDR_WIDTH: integer:=8;
   constant DATA_WIDTH: integer:=12;
   type rom_type is array (0 to 2**ADDR_WIDTH-1)
        of std_logic_vector(DATA_WIDTH-1 downto 0);
   -- ROM definition
   constant colormap: rom_type:=(  -- 2^4-by-12
      x"000",
      x"ea6",
      x"ea6",
      x"eb5",
      x"eb5",
      x"ec5",
      x"ec5",
      x"ed5",
      x"ed5",
      x"ee5",
      x"ee5",
      x"ef4",
      x"ef4",
      x"ee4",
      x"ee4",
      x"ee4",
      x"ee4",
      x"ee4",
      x"ee4",
      x"ed5",
      x"ed5",
      x"ed5",
      x"ed5",
      x"ed5",
      x"ec5",
      x"ec5",
      x"ec5",
      x"ec5",
      x"ec5",
      x"ec5",
      x"eb5",
      x"eb5",
      x"eb5",
      x"eb5",
      x"eb5",
      x"eb5",
      x"ea5",
      x"ea5",
      x"ea5",
      x"ea5",
      x"ea5",
      x"e95",
      x"e95",
      x"e95",
      x"e95",
      x"e95",
      x"e95",
      x"e85",
      x"e85",
      x"e85",
      x"e85",
      x"e86",
      x"e86",
      x"e76",
      x"e76",
      x"e76",
      x"e76",
      x"e76",
      x"e76",
      x"e66",
      x"e66",
      x"e66",
      x"e66",
      x"e66",
      x"e56",
      x"e56",
      x"e56",
      x"e56",
      x"e56",
      x"e56",
      x"e46",
      x"e46",
      x"e46",
      x"e46",
      x"e46",
      x"e46",
      x"e36",
      x"e36",
      x"e36",
      x"e36",
      x"e36",
      x"e26",
      x"e26",
      x"e27",
      x"e27",
      x"e27",
      x"e27",
      x"e17",
      x"e17",
      x"e17",
      x"e17",
      x"d17",
      x"d17",
      x"d17",
      x"d17",
      x"c17",
      x"c17",
      x"c17",
      x"b17",
      x"b16",
      x"b26",
      x"a26",
      x"a26",
      x"a26",
      x"a26",
      x"926",
      x"926",
      x"926",
      x"836",
      x"836",
      x"836",
      x"836",
      x"836",
      x"836",
      x"836",
      x"836",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"736",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"636",
      x"536",
      x"536",
      x"536",
      x"536",
      x"536",
      x"536",
      x"526",
      x"526",
      x"526",
      x"526",
      x"526",
      x"526",
      x"526",
      x"526",
      x"526",
      x"526",
      x"526",
      x"526",
      x"526",
      x"526",
      x"526",
      x"526",
      x"426",
      x"426",
      x"426",
      x"426",
      x"426",
      x"426",
      x"426",
      x"426",
      x"426",
      x"426",
      x"426",
      x"426",
      x"436",
      x"536",
      x"546",
      x"646",
      x"646",
      x"656",
      x"756",
      x"756",
      x"766",
      x"866",
      x"876",
      x"876",
      x"976",
      x"986",
      x"a86",
      x"a86",
      x"a96",
      x"b96",
      x"ba6",
      x"ba6",
      x"ca6",
      x"cb6",
      x"cb6",
      x"db6",
      x"dc6",
      x"ec7",
      x"dc7",
      x"dc7",
      x"cc7",
      x"cc7",
      x"cc7",
      x"bc7",
      x"bc7",
      x"ac7",
      x"ac7",
      x"9c7",
      x"9c7",
      x"9c7",
      x"8c7",
      x"8c7",
      x"7c7",
      x"7c7",
      x"6c7",
      x"6c7",
      x"6c7",
      x"5c7",
      x"5c7",
      x"4c7",
      x"4c7",
      x"3c7",
      x"3c7",
      x"3c7",
      x"2c7",
      x"2c7",
      x"1c7",
      x"1c7",
      x"0c7",
      x"0d8",
      x"0d8",
      x"0d8",
      x"0d8",
      x"0d8",
      x"0d7",
      x"0d7"
	  );
   signal addr_reg: std_logic_vector(ADDR_WIDTH-1 downto 0);
begin
   -- addr register to infer block RAM
   process (clk)
   begin
      if (clk'event and clk = '1') then
        addr_reg <= addr;
      end if;
   end process;
   data <= colormap(to_integer(unsigned(addr_reg)));
end arch;