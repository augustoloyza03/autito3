-- CODIGO DE UNA PARTE DE LA UBICACION DE LA RATA ESTA (LA RESPUESTA DE ESTA MAQUINA DE ESTADO ES LO Q HAY Q SUMARLE A LA POSICION ANTERIOR)
-- ESTA ES LA PARTE 2, LA PARTE 1 SERIA EL ANTIREBOTE PARA Q ENTRE EL MINIMO RUIDO POSIBLE
-- LA PARTE 3 SERIA LA DE SUMAR LA RESPUESTA DE ESTA MAQUINA DE ESTADO A LA POSICION ANTERIOR EN LA CUAL INICIALIZA EN 0000 YA Q ESA ES LA POSICION INICIAL
--DESPUES FALTARIA EL CONTADOR DE 7 SEGMENTOS
LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY ubicacionparte2v2 IS
    PORT (
        reset : IN STD_LOGIC := '0';
        clock : IN STD_LOGIC;
        Gizq : IN STD_LOGIC := '0';
        Gder : IN STD_LOGIC := '0';
        S : IN STD_LOGIC := '0';
        Z2 : OUT STD_LOGIC;
        Z1 : OUT STD_LOGIC;
        Z0 : OUT STD_LOGIC;
        SorR : OUT STD_LOGIC;
		  o_1,o_0 : out std_logic
    );
END ubicacionparte2v2;

ARCHITECTURE BEHAVIOR OF ubicacionparte2v2 IS
    TYPE type_fstate IS (O1,O2,O3,O4,RESTAR1,SUMAR4,SUMAR1,RESTAR4,RESTAR1b,SUMAR4b,SUMAR1b,RESTAR4b);
    SIGNAL fstate : type_fstate;
    SIGNAL reg_fstate : type_fstate;
BEGIN
    PROCESS (clock,reg_fstate)
    BEGIN
        IF (clock='1' AND clock'event) THEN
            fstate <= reg_fstate;
        END IF;
    END PROCESS;

    PROCESS (fstate,reset,Gizq,Gder,S)
    BEGIN
        IF (reset='1') THEN
            reg_fstate <= O1;
            Z2 <= '0';
            Z1 <= '0';
            Z0 <= '0';
            SorR <= '0';
				o_1<='1' ;o_0<='1';
        ELSE
            Z2 <= '0';
            Z1 <= '0';
            Z0 <= '0';
            SorR <= '0';
				o_1<='1' ;o_0<='1';
            CASE fstate IS
                WHEN O1 =>
					 o_1<='1' ;o_0<='1';
                    IF ((S = '1')) THEN
                        reg_fstate <= O1;
                    ELSIF ((((Gizq = '0') AND (Gder = '1')) AND (S = '0'))) THEN
                        reg_fstate <= RESTAR1;
                    ELSIF ((((Gizq = '1') AND (Gder = '1')) AND (S = '0'))) THEN
                        reg_fstate <= RESTAR4;
                    ELSIF ((((Gizq = '1') AND (Gder = '0')) AND (S = '0'))) THEN
                        reg_fstate <= SUMAR1;
                    ELSIF ((((Gizq = '0') AND (Gder = '0')) AND (S = '0'))) THEN
                        reg_fstate <= SUMAR4;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= O1;
                    END IF;

                    Z2 <= '0';

                    Z1 <= '0';

                    Z0 <= '0';

                    SorR <= '0';
                WHEN O2 =>
					  o_1<='0' ;o_0<='1';
                    IF ((S = '1')) THEN
                        reg_fstate <= O2;
                    ELSIF ((((Gizq = '0') AND (Gder = '0')) AND (S = '0'))) THEN
                        reg_fstate <= RESTAR1;
                    ELSIF ((((Gizq = '0') AND (Gder = '1')) AND (S = '0'))) THEN
                        reg_fstate <= RESTAR4;
                    ELSIF ((((Gizq = '1') AND (Gder = '1')) AND (S = '0'))) THEN
                        reg_fstate <= SUMAR1;
                    ELSIF ((((Gizq = '1') AND (Gder = '0')) AND (S = '0'))) THEN
                        reg_fstate <= SUMAR4;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= O2;
                    END IF;

                    Z2 <= '0';

                    Z1 <= '0';

                    Z0 <= '0';

                    SorR <= '0';
                WHEN O3 =>
					  o_1<='1' ;o_0<='0';
                    IF ((S = '1')) THEN
                        reg_fstate <= O3;
                    ELSIF ((((Gizq = '1') AND (Gder = '1')) AND (S = '0'))) THEN
                        reg_fstate <= RESTAR1;
                    ELSIF ((((Gizq = '1') AND (Gder = '0')) AND (S = '0'))) THEN
                        reg_fstate <= RESTAR4;
                    ELSIF ((((Gizq = '0') AND (Gder = '0')) AND (S = '0'))) THEN
                        reg_fstate <= SUMAR1;
                    ELSIF ((((Gizq = '0') AND (Gder = '1')) AND (S = '0'))) THEN
                        reg_fstate <= SUMAR4;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= O3;
                    END IF;

                    Z2 <= '0';

                    Z1 <= '0';

                    Z0 <= '0';

                    SorR <= '0';
                WHEN O4 =>
					 o_1<='0' ;o_0<='0'; 
                    IF ((S = '1')) THEN
                        reg_fstate <= O4;
                    ELSIF ((((Gizq = '1') AND (Gder = '0')) AND (S = '0'))) THEN
                        reg_fstate <= RESTAR1;
                    ELSIF ((((Gizq = '0') AND (Gder = '0')) AND (S = '0'))) THEN
                        reg_fstate <= RESTAR4;
                    ELSIF ((((Gizq = '0') AND (Gder = '1')) AND (S = '0'))) THEN
                        reg_fstate <= SUMAR1;
                    ELSIF ((((Gizq = '1') AND (Gder = '1')) AND (S = '0'))) THEN
                        reg_fstate <= SUMAR4;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= O4;
                    END IF;

                    Z2 <= '0';

                    Z1 <= '0';

                    Z0 <= '0';

                    SorR <= '0';
                WHEN RESTAR1 =>
                    reg_fstate <= RESTAR1b;

                    Z2 <= '0';

                    Z1 <= '0';

                    Z0 <= '1';

                    SorR <= '1';
                WHEN SUMAR4 =>
                    reg_fstate <= SUMAR4b;

                    Z2 <= '1';

                    Z1 <= '0';

                    Z0 <= '0';

                    SorR <= '0';
                WHEN SUMAR1 =>
                    reg_fstate <= SUMAR1b;

                    Z2 <= '0';

                    Z1 <= '0';

                    Z0 <= '1';

                    SorR <= '0';
                WHEN RESTAR4 =>
                    reg_fstate <= RESTAR4b;

                    Z2 <= '1';

                    Z1 <= '0';

                    Z0 <= '0';

                    SorR <= '1';
                WHEN RESTAR1b =>
                    IF ((S = '1')) THEN
                        reg_fstate <= O2;
                    ELSIF ((S = '0')) THEN
                        reg_fstate <= RESTAR1b;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= RESTAR1b;
                    END IF;

                    Z2 <= '0';

                    Z1 <= '0';

                    Z0 <= '0';

                    SorR <= '0';
                WHEN SUMAR4b =>
                    IF ((S = '1')) THEN
                        reg_fstate <= O1;
                    ELSIF ((S = '0')) THEN
                        reg_fstate <= SUMAR4b;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= SUMAR4b;
                    END IF;

                    Z2 <= '0';

                    Z1 <= '0';

                    Z0 <= '0';

                    SorR <= '0';
                WHEN SUMAR1b =>
                    IF ((S = '1')) THEN
                        reg_fstate <= O3;
                    ELSIF ((S = '0')) THEN
                        reg_fstate <= SUMAR1b;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= SUMAR1b;
                    END IF;

                    Z2 <= '0';

                    Z1 <= '0';

                    Z0 <= '0';

                    SorR <= '0';
                WHEN RESTAR4b =>
                    IF ((S = '1')) THEN
                        reg_fstate <= O4;
                    ELSIF ((S = '0')) THEN
                        reg_fstate <= RESTAR4b;
                    -- Inserting 'else' block to prevent latch inference
                    ELSE
                        reg_fstate <= RESTAR4b;
                    END IF;

                    Z2 <= '0';

                    Z1 <= '0';

                    Z0 <= '0';

                    SorR <= '0';
                WHEN OTHERS => 
                    Z2 <= 'X';
                    Z1 <= 'X';
                    Z0 <= 'X';
                    SorR <= 'X';
                    report "Reach undefined state";
            END CASE;
        END IF;
    END PROCESS;
END BEHAVIOR;
