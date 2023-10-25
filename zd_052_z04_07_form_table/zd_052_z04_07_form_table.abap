*&---------------------------------------------------------------------*
*& Report ZD_052_Z04_07_FORM_TABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z04_07_FORM_TABLE.

TYPES : BEGIN OF t_str,
  col1 TYPE c,
  col2 TYPE i,
END OF t_Str.

TYPES : t_itab TYPE TABLE OF t_Str.

DATA: gs_str TYPE t_str,
      gt_itab TYPE t_itab.

gs_str-col1 = 'A'.
gs_str-col2 = 1.
APPEND gs_str TO gt_itab.

gs_str-col1 = 'B'.
gs_str-col2 = 2.
APPEND gs_str TO gt_itab.

PERFORM test_itab USING gt_itab.

FORM test_itab USING pt_itab TYPE t_itab.

  READ TABLE pt_itab WITH KEY col1 = 'A' INTO gs_str.
  IF SY-SUBRC EQ 0.
    WRITE : gs_str-col1, gs_str-col2.
  ENDIF.
ENDFORM. " test_itab

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
