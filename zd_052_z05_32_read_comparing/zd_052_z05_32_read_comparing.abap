*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_32_READ_COMPARING
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_32_READ_COMPARING.

DATA : BEGIN OF gs_line,
  col1 TYPE c,
  col2 TYPE i,
  END OF gs_line.

DATA gt_itab LIKE SORTED TABLE OF gs_line WITH UNIQUE KEY col1.

gs_line-col1 = 'A'. gs_line-col2 = 1.
INSERT gs_line INTO TABLE gt_itab.
CLEAR gs_line.

gs_line-col1 = 'B'. gs_line-col2 = 2.
INSERT gs_line INTO TABLE gt_itab.
CLEAR gs_line.

gs_line-col1 = 'A'.

"COMPARING 옵션 붙으면 col2 와 비교해서
READ TABLE gt_itab FROm gs_line
  INTO gs_line COMPARING col2.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
