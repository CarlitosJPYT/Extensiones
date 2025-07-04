000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. BD.
000300 ENVIRONMENT DIVISION.
000400 DATA DIVISION.
000500 FILE SECTION.
000600 WORKING-STORAGE SECTION.
000700 01 OPCIONES PIC 9   VALUE ZERO.
000800     88 SUMAR        VALUE 1.
000900     88 RESTAR       VALUE 2.
001000     88 MULTIPLICAR  VALUE 3.
001100     88 DIVIDIR      VALUE 4.
001200     88 SALIR        VALUE 5.
001300 77 NUMERO1   PIC 99      VALUE ZERO.
001400 77 NUMERO2   PIC 99      VALUE ZERO.
001500 77 RESULTADO PIC S999V99 VALUE ZERO.
001600 PROCEDURE DIVISION.
001700 DATOS.
001800     DISPLAY "ELIGE UNA OPCION:".
001900     DISPLAY "1. SUMAR".
002000     DISPLAY "2. RESTAR".
002100     DISPLAY "3. MULTIPLICAR".
002200     DISPLAY "4. DIVIDIR".
002300     DISPLAY "5. SALIR.".
002400     ACCEPT OPCIONES.
002500     EVALUATE TRUE
002600         WHEN SUMAR
002700             PERFORM SUMA
002800         WHEN RESTAR
002900             PERFORM RESTA
003000         WHEN MULTIPLICAR
003100             PERFORM MULTIPLICACION
003200         WHEN DIVIDIR
003300             PERFORM DIVIDIENDO
003400         WHEN SALIR
003500             DISPLAY "SALIENDO DEL PROGRAMA..."
003600             STOP RUN
003700         WHEN OTHER
003800             DISPLAY "OPCION INVALIDA, INTENTELO DE NUEVO"
003900             PERFORM DATOS
004000     END-EVALUATE.
004100 SUMA.
004200     DISPLAY "HAZ ELEGIDO SUMAR.".
004300     DISPLAY "INGRESE EL PRIMER NUMERO:".
004400     ACCEPT NUMERO1.
004500     DISPLAY "INGRESE EL SEGUNDO NUMERO:".
004600     ACCEPT NUMERO2.
004700     ADD NUMERO1 TO NUMERO2 GIVING RESULTADO.
004800     DISPLAY "EL RESULTADO DE LA SUMA ES: " RESULTADO.
004900     PERFORM DATOS.
005000 RESTA.
005100     DISPLAY "HAZ ELEGIDO RESTAR.".
005200     DISPLAY "INGRESA EL PRIMER NUMERO:".
005300     ACCEPT NUMERO1.
005400     DISPLAY "INGRESA EL SEGUNDO NUMERO:".
005500     ACCEPT NUMERO2.
005600     SUBTRACT NUMERO2 FROM NUMERO1 GIVING RESULTADO.
005700     DISPLAY "EL RESULTADO DE LA RESTA ES: " RESULTADO.
005800     PERFORM DATOS.
005900 MULTIPLICACION.
006000     DISPLAY "HAZ ELEGIDO MULTIPLICAR.".
006100     DISPLAY "INGRESA EL PRIMER NUMERO:".
006200     ACCEPT NUMERO1.
006300     DISPLAY "INGRESA EL SEGUNDO NUMERO:".
006400     ACCEPT NUMERO2.
006500     MULTIPLY NUMERO1 BY NUMERO2 GIVING RESULTADO.
006600     DISPLAY "EL RESULTADO DE LA MULTIPLICACION ES: " RESULTADO.
006700     PERFORM DATOS.
006800 DIVIDIENDO.
006900     DISPLAY "HAZ ELEGIDO DIVIDIR.".
007000     DISPLAY "INGRESA EL PRIMER NUMERO:".
007100     ACCEPT NUMERO1.
007200     DISPLAY "INGRESA EL SEGUNDO NUMERO:".
007300     ACCEPT NUMERO2.
007400     IF NUMERO2 EQUAL TO ZERO THEN
007500         DISPLAY "ERROR: DIVISION POR CERO NO PERMITIDA."
007600         ELSE
007700             DIVIDE NUMERO1 BY NUMERO2 GIVING RESULTADO
007800             DISPLAY "EL RESULTADO DE LA DIVISION ES: " RESULTADO
007900     END-IF.
008000     PERFORM DATOS.
008100 END PROGRAM BD.
