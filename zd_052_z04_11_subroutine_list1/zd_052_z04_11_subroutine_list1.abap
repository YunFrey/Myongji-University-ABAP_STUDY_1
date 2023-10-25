*&---------------------------------------------------------------------*
*& Report ZD_052_Z04_11_SUBROUTINE_LIST1
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z04_11_SUBROUTINE_LIST1.

DO 2 TIMES.
  PERFORM SY-INDEX OF subr1 subr2.
ENDDO.

FORM subr1.
  WRITE / 'subr1 이 호출됨.'.
ENDFORM.

FORM subr2.
  WRITE / 'subr2 이 호출됨.'.
ENDFORM.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
