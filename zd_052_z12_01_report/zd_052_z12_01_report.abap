*&---------------------------------------------------------------------*
*& Report ZD_052_Z12_01_REPORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z12_01_REPORT.

DATA : gt_sflight TYPE TABLE OF sflight,
      gs_sflight TYPE sflight.

SELECT-OPTIONS : s_carrid FOR gs_sflight-carrid.

INITIALIZATION.
  s_carrid-sign = 'I'.
  s_carrid-option = 'EQ'.
  s_carrid-low = 'AA'.
  APPEND s_carrid.

START-OF-SELECTION.
  SELECT carrid connid
    FROM sflight
    INTO CORRESPONDING FIELDS OF TABLE gt_sflight
    WHERE carrid IN s_carrid.

END-OF-SELECTION.
    LOOP AT gt_sflight INTO gs_sflight.
      WRITE : / gs_sflight-carrid, gs_sflight-connid.
    ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
