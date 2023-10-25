*&---------------------------------------------------------------------*
*& Report ZD052_Z05_25_MODIFY_TABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_25_MODIFY_TABLE.

DATA : BEGIN OF gs_line,
  col1(2) TYPE c,
  col2 TYPE i,
  col3 TYPE sy-datum,
END OF gs_line.

DATA gt_itab LIKE StANDARD TABLE OF gs_line WITH NON-UNIQUE KEY col1 col2.

gs_line-col1 = 'AA'.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
