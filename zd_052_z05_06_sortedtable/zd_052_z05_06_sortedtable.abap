*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_06_SORTEDTABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_06_SORTEDTABLE.

** Structure Type 선언
TYPES : BEGIN OF t_line,
  col TYPE c,
  seq TYPE i,
  END OF t_line.

** Standard Table 타입 선언
TYPES t_tab TYPE SORTED TABLE OF t_line WITH UNIQUE KEY col.

** Internal Table 선언
DATA gt_itab TYPE t_tab WITH HEADER LINE.

gt_itab-col = 'B'.
gt_itab-seq = '1'.
INSERT TABLE gt_itab. "주의! : SORTED TABLE 은 APPEND 사용 불가

gt_itab-col = 'A'.
gt_itab-seq = '2'.
INSERT TABLE gt_itab.

CLEAR gt_itab. " 초기화

READ TABLE gt_itab INDEX 2.
WRITE : / gt_itab-col, gt_itab-seq.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
