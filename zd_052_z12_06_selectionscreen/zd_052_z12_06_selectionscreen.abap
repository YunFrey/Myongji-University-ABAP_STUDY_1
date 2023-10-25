*&---------------------------------------------------------------------*
*& Report ZD_052_Z12_06_SELECTIONSCREEN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z12_06_SELECTIONSCREEN.

TABLES : scarr, sscrfields.

SELECTION-SCREEN BEGIN OF LINE.
SELECTION-SCREEN COMMENT 1(10) text-001 FOR FIELD p_1.
PARAMETERS : p_1 LIKE scarr-carrid.

SELECTION-SCREEN POSITION POS_LOW.
PARAMETERS : p_2 LIKE scarr-carrname.

SELECTION-SCREEN END OF LINE.

SELECTION-SCREEN SKIP 2.
SELECTION-SCREEN ULINE.
SELECTION-SCREEN ULINE /1(10).
SELECTION-SCREEN ULINE pos_low(10).
SELECTION-SCREEN ULINE pos_high(10).

SELECTION-SCREEN PUSHBUTTON /pos_low(10) text_002 USER-COMMAND btn01.

SELECTION-SCREEN BEGIN OF BLOCK block WITH FRAME TITLE text-003.
PARAMETERS : p_3 TYPE c.
SELECT-OPTIONS : s_1 FOR scarr-carrid.
SELECTION-SCREEN END OF BLOCK block.

SELECTION-SCREEN BEGIN OF BLOCK block2 WITh FRAME TITLE text-004
NO INTERVALS.
PARAMETERS : p_4 TYPE c.
SELECT-OPTIONS : s_2 FOR scarr-carrid.
SELECTION-SCREEN END OF BLOCK block2.
SELECTION-SCREEN FUNCTION KEY 1.

INITIALIZATION.
MOVE 'Function key 1' TO sscrfields-functxt_01.

AT SELECTIOn-SCREEN.
  IF sscrfields-ucomm = 'FC01'.
    MESSAGE 'Function Key1 을 클릭하셨습니다' TYPE 'I'. "I타입의 메세지 생성
  ENDIF.
  IF sscrfields-ucomm = 'BTN01'.
    MESSAGE 'Function Key button 을 클릭했습니다' TYPE 'I'. "I타입의 메세지 생성
  ENDIF.

*Text elements
*----------------------------------------------------------
* 001 Flight ID


*Messages
*----------------------------------------------------------
*
* Message class: Hard coded
*   Function Key1 을 클릭하셨습니다

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
