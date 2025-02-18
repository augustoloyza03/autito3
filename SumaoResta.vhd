library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SumaoResta is
    port (
        Z0, Z1, Z2 : in std_logic;       -- bits q se van a sumar dependiendo la posicion a la q se mueva el robot
        SorR : in std_logic;             -- control para suma (0) o resta (1)
        clock : in std_logic;
        p0, p1, p2, p3 : out std_logic   -- bits de la posicion actual (salida)
    );
end SumaoResta;

architecture Behavioral of SumaoResta is
    signal Z : std_logic_vector(3 downto 0);
    signal a : std_logic_vector(3 downto 0) := "0000"; -- Inicialización en cero (pocision incial del robot que en este caso seria la posicion vieja)
    signal p : std_logic_vector(3 downto 0);
begin
    Z <= '0' & Z2 & Z1 & Z0; --- concateno los bits z y le agrego un 0 al principio para q coincidan la cant de bits con la pociosion (q son 4)

    process(clock)
    begin
        if rising_edge(clock) then
            if SorR = '0' then
                p <= a + Z;   -- Suma si SorR es 0
            else
                p <= a - Z;   -- Resta si SorR es 1
            end if;
            -- actualizo el valor actual de p, para q la proxima utilice este numero ya q sera la pocision del robot vieja
            a <= p;
        end if;
    end process;
    p3 <= p(3);
    p2 <= p(2);
    p1 <= p(1);
    p0 <= p(0);
end Behavioral;