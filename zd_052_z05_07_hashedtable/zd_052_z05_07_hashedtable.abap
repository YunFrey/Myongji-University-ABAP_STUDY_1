*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_07_HASHEDTABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_07_HASHEDTABLE.


**1. 구조체 선언
TYPES : BEGIN OF t_line,
  col TYPE c,
  seq TYPE i,
  END OF t_line.

**2. Standard Table 타입 선언
  TYPES t_tab TYPE HASHED TABLE OF t_line WITH UNIQUE KEY col. "col 값이 UNIQUE 키임 col 값은 해시값으로 변경저장됨

* 3. Internal Table 선언
DATA gt_itab TYPE t_tab WITH HEADER LINE.

gt_itab-col = 'B'.
gt_itab-seq = '1'.
INSERT TABLE gt_itab.

gt_itab-col = 'A'.
gt_itab-seq = '2'.
INSERT TABLE gt_itab.

CLEAR gt_itab.
READ TABLE gt_itab WITH TABLE KEy col = 'A'. " HASHED TABLE 은 KEY 값으로만 접근 가능

WRITE : / gt_itab-col, gt_itab-seq.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
