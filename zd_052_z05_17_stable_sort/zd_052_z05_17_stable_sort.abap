*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_17_STABLE_SORT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_17_STABLE_SORT.

DATA : BEGIN OF gs_line,
  col1 TYPE c,
  col2 TYPE i,
  END OF gs_line.

DATA gt_itab LIKE STANDARD TABLE OF gs_line WITH NON-UNIQUE KEY col1.

  "주의 : APPEND는 STANDARD 에서만 사용가능
gs_line-col1 = 'B'.
gs_line-col2 = 3.
APPEND gs_line TO gt_itab.

gs_line-col1 = 'C'.
gs_line-col2 = 4.
APPEND gs_line TO gt_itab.

gs_line-col1 = 'A'.
gs_line-col2 = 2.
APPEND gs_line TO gt_itab.

SORT gt_itab.
PERFORM write_data.

SORT gt_itab BY col1 col2.
PERFORM write_data.

SORT gt_itab BY col1 DESCENDING col2 ASCENDING.
PERFORM write_data.

FORM write_data.
  LOOP AT gt_itab INTO gs_line.
    WRITE : / gs_line-col1, gs_line-col2.
  ENDLOOP.
  ULINE. "새 공백 라인 생성
ENDFORM. "WRITE_DATA

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
