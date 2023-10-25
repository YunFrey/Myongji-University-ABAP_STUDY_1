*&---------------------------------------------------------------------*
*& Report ZD_052_Z04_13_SUBR_PARAM_CASE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z04_13_SUBR_PARAM_CASE.

PARAMETERS : p_val TYPE CHAR10.
PERFORm end_subr USING p_val.

FORM end_subr USING VALUE(p_val).

  CASE p_val. " p_val 의 값이
    WHEN 'EXIT'.
      WRITE '서브루틴 종료'.
      EXIT. "서브루틴 BREAK
    WHEN 'CHECK'.
      WRITE '서브루틴 체크'.
      CHECK p_val NE 'CHECK'. "p_val이 CHECK 일 때만 BREAK
    WHEN OTHERS.
   ENDCASE.

   WRITE '서브루틴이 정상적으로 끝까지 수행됨'.
ENDFORM.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
