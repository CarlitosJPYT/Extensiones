       IDENTIFICATION DIVISION.
       PROGRAM-ID. DB.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       SELECT OPTIONAL EMPLEADOS-ARCHIVOS
       ASSIGN TO "empleados.dat"
       ORGANIZATION IS SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD EMPLEADOS-ARCHIVOS.
           01 EMPLEADOS-REGISTROS.
               02 EMPLEADOS-ID PIC X(6).
               02 EMPLEADOS-NOMBRE PIC X(25).
               02 EMPLEADOS-APELLIDOS PIC X(35).
               02 EMPLEADOS-EDAD PIC 99.
       WORKING-STORAGE SECTION.
       01 IDENTIFICADOR PIC X(36) VALUE "INTRODUCE EL ID DEL EMPLEADO".
       01 NOMBRE PIC X(33) VALUE "INTRODUCE EL NOMBRE DEL EMPLEADO".
       01 APELLIDO PIC X(34) VALUE "INTRODUCE EL APELLIDO DEL EMPLEADO".
       01 EDAD PIC X(30) VALUE "INTRODUCE LA EDAD DEL EMPLEADO".
       01 SI-NO PIC X.
       01 ENTRY-OK PIC X.
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
       END PROGRAM DB.
