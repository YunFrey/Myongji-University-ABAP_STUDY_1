*&---------------------------------------------------------------------*
*& Report ZD_052_Z12_05_SELECTION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z12_05_SELECTION.

TABLES : sflight.
DATA : gs_scarr TYPE scarr.
DATA : gv_val TYPE char20.

SELECT-OPTIONS : s_1 FOR sflight-carrid DEFAULT 'AC',
                 s_2 FOR gs_scarr-carrid DEFAULT 'AA*'
                 OPTION EQ SIGN I,
                 s_3 FOR gv_val DEFAULT '1111' TO '9999',
                 s_4 FOR gv_val DEFAULT 'AAAA' TO 'ZZZZ'
                 OPTION BT SIGN E,
                 s_5 FOR sflight-carrid MEMORY ID scl,
                 s_6 FOR gv_val MATCHCODE OBJECT zcarrid,
                 s_7 FOR sflight-carrid MODIF ID car,
                 s_8 FOR sflight-carrid NO-DISPLAY,
                 s_9 FOR sflight-carrid LOWER CASE,
                 s_10 FOR sflight-carrid OBLIGATORY, "필수
                 s_11 FOR sflight-carrid NO-EXTENSION,
                 s_12 FOR sflight-carrid NO INTERVALS,
                 s_13 FOR sflight-carrid VISIBLE LENGTH 1.

START-OF-SELECTION.
"SELECT * FROM SPFLIGHT WHERE CARRID IN s_1.
END-OF-SELECTION.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
