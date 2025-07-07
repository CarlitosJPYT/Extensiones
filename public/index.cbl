      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. INDEX.
       ENVIRONMENT DIVISION.
       COPY "basedata.cob".
       DATA DIVISION.
       COPY "script.cob".
       WORKING-STORAGE SECTION.
       COPY "main.cbl".
       PROCEDURE DIVISION.
       MAIN-LOGIC SECTION.
       PROGRAM-BEGIN.
           PERFORM PROCEDIMIENTO-DE-APERTURA.
           MOVE "S" TO SI-NO.
           PERFORM AGREGAR-REGISTROS UNTIL SI-NO EQUAL "N".
           PERFORM PROCEDIMIENTO-DE-CIERRE.
       PROGRAM-DONE.
           STOP RUN.
       PROCEDIMIENTO-DE-APERTURA.
           OPEN EXTEND EMPLEADOS-ARCHIVOS.
       PROCEDIMIENTO-DE-CIERRE.
           CLOSE EMPLEADOS-ARCHIVOS.
       AGREGAR-REGISTROS.
           MOVE "N" TO ENTRY-OK.
           PERFORM OBTENER-CAMPOS UNTIL ENTRY-OK EQUAL "S".
           PERFORM ESCRIBIR-REGISTRO.
           PERFORM REINICIAR.
       OBTENER-CAMPOS.
           MOVE SPACE TO EMPLEADOS-REGISTROS.
           DISPLAY IDENTIFICADOR.
           ACCEPT EMPLEADOS-ID.
           DISPLAY NOMBRE.
           ACCEPT EMPLEADOS-NOMBRE.
           DISPLAY APELLIDO.
           ACCEPT EMPLEADOS-APELLIDOS.
           DISPLAY EDAD.
           ACCEPT EMPLEADOS-EDAD.
           PERFORM VALIDAR-CAMPOS.
       VALIDAR-CAMPOS.
           MOVE "S" TO ENTRY-OK.
           IF EMPLEADOS-NOMBRE EQUAL SPACE THEN DISPLAY
               "ERROR: DEBES ESPECIFICAR UN NOMBRE."
               MOVE "N" TO ENTRY-OK.
       ESCRIBIR-REGISTRO.
           WRITE EMPLEADOS-REGISTROS.
       REINICIAR.
           DISPLAY "DESEAS ALMACENAR OTRO REGISTRO EN LA BASE DE DATOS."
           ACCEPT SI-NO.
           IF SI-NO EQUAL "s" THEN MOVE "S" TO SI-NO.
           IF SI-NO NOT EQUAL "S" THEN MOVE "N" TO SI-NO.
       END PROGRAM INDEX.
