*&---------------------------------------------------------------------*
*& Report ZD_052_Z04_02_PARAMETER_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z04_02_FORM_CALLBYVALUE.

DATA : gv_val TYPE c LENGTH 20 VALUE '매개변수 이름'.

PERFORM methodname USING gv_val.

FORM methodname USING VALUE(p1).
  WRITE p1.
ENDFORM.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
