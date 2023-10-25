*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_22_APPEND_INITIAL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_22_APPEND_INITIAL.

DATA: BEGIN OF gs_line,
  col1 TYPE c,
  col2 TYPE i,
  END OF gs_line.

DATA gt_itab LIKE TABLE OF gs_line INITIAL SIZE 2. " 빈 공간을 이미 만들고 APPEND 하기

gs_line-col1 = 'C'.
gs_line-col2 = 1.
APPEND gs_line TO gt_itab SORTED BY col1. "col1 으로 정렬수행 후 C/1 추가

gs_line-col1 = 'A'.
gs_line-col2 = 2.
APPEND gs_line TO gt_itab SORTED BY col1.

gs_line-col1 = 'B'.
gs_line-col2 = 3.
APPEND gs_line TO gt_itab SORTED BY col1.

LOOP AT gt_itab INTO gs_line. "이때 INITIAL SIZE 는 2 이기 때문에 3번째 INDEX 는 짤림
  WRITE : / gs_line-col1, gs_line-col2.
ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
