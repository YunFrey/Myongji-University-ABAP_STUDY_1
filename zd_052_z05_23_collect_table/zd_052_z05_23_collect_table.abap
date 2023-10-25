*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_23_COLLECT_TABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_23_COLLECT_TABLE.

DATA : BEGIN OF gs_line,
  col1(3) TYPE c,
  col2(2) TYPE n,
  col3 TYPE i,
  END OF gs_line.

DATA gt_itab LIKE STANDARD TABLE OF gs_line WITH NON-UNIQUE KEY col1 col2.

"col3 의 경우에만 i 타입이라 collect 가능
gs_line-col1 = 'AA'. gs_line-col2 = '17'. gs_line-col3 = 660.
COLLECT gs_line INTO gt_itab.

gs_line-col1 = 'AL'. gs_line-col2 = '34'. gs_line-col3 = 220.
COLLECT gs_line INTO gt_itab.

gs_line-col1 = 'AA'. gs_line-col2 = '17'. gs_line-col3 = 6280.
COLLECT gs_line INTO gt_itab.

LOOP AT gt_itab INTO gs_line.
  WRITE :/ gs_line-col1, gs_line-col2, gs_line-col3.
ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
