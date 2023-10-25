*&---------------------------------------------------------------------*
*& Report ZD_052_Z12_10_ATSELSCRN_OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z12_10_ATSELSCRN_OUTPUT.

TABLES : scarr.
SELECT-OPTIONS : s_carrid FOR scarr-carrid MODIF ID scl. "s_carrid 입력 필드 속성을 scl로 지정
PARAMETERS : p_test(10) TYPE c MODIF ID sc2. "p_test 입력 필드 속성을 sc2 로 지정

AT SELECTION-SCREEN OUTPUT.
  LOOP AT SCREEN. "SCREEN에 있는 모든 요소 스캔
    IF screen-group1 = 'SC1'. "해당 필드의 group1 이 SC1이면
      screen-intensified = '1'. "intensified =1
    ELSEIF screen-group1 = 'SC2'. "해당 필드의 group1이 SC2면
      screen-input = '0'. " input = 0
    ENDIF.
    MODIFY SCREEN. "SCREEN에 변경된 속성값 반영
  ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
