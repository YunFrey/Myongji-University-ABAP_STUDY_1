*&---------------------------------------------------------------------*
*& Report ZD_052_Z12_09_ATSELSCR_ONENDOF
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z12_09_ATSELSCR_ONENDOF.

TABLES : scarr.
SELECT-OPTIONS : s_carrid FOR scarr-carrid.

AT SELECTION-SCREEN ON END OF s_carrid.
  LOOP AT s_carrid. "s_carrid 엔티티를 순환하여 탐색
      IF s_carrid-low IS INITIAL. "s_carrid 좌측값이 초기상태면
        MESSAGE 'low값은 반드시 넣어야 합니다' TYPE 'E'. "에러타입의 메세지 출력
        ENDIF.
    ENDLOOP.


*Messages
*----------------------------------------------------------
*
* Message class: Hard coded
*   low값은 반드시 넣어야 합니다

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
