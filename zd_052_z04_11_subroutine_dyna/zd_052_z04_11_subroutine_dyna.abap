*&---------------------------------------------------------------------*
*& Report ZD_052_Z04_11_SUBROUTINE_DYNA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z04_11_SUBROUTINE_DYNA.

DATA gv_pname(8) TYPE c VALUE '프로그램명'.
DATA gv_subname TYPE c LENGTH 20 VALUE '모듈명'.

"대소문자를 모두 대문자로 변경
TRANSLATE gv_pname TO UPPER CASE.

PERFORM (gv_subname) IN PROGRAM (gv_pname) IF FOUND.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
