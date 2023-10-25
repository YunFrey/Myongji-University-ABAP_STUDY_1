*&---------------------------------------------------------------------*
*& Report ZD_052_Z12_08_ATSELSCREENON
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z12_08_ATSELSCREENON.

TABLES : scarr.

SELECT-OPTIONS : s_carrid FOR scarr-carrid.

AT SELECTION-SCREEN ON s_carrid. "s_carrid 필드 조정

  IF s_carrid-low NE 'AA'. "s_carrid 좌측값이 AA가 아니면
    MESSAGE 'AA 값은 반드시 넣어야 합니다' TYPE 'E'. "Error 타입의 메세지 전달
  ENDIF.


*Messages
*----------------------------------------------------------
*
* Message class: Hard coded
*   AA 값은 반드시 넣어야 합니다

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
