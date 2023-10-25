*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_20_INSERT_T_ST_HT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_20_INSERT_T_ST_HT.

DATA : BEGIN OF gs_line,
  col1 TYPE c,
  col2 TYPE n,
  END OF gs_line.

  START-OF-SELECTION.

  "STANDARD TABLE
WRITE : / 'STANDARD', / .
DATA gt_itab1 LIKE STANDARD TABLE OF gs_line WITH NON-UNIQUE KEY col1.

gs_line-col1 = 'B'.
gs_line-col2 = 1.
INSERT gs_line INTO TABLE gt_itab1.
WRITE : 'SUBRC : ', SY-SUBRC.

gs_line-col1 = 'A'.
gs_line-col2 = 2.
INSERT gs_line INTO TABLE gt_itab1.
WRITE : 'SUBRC : ', SY-SUBRC.

gs_line-col1 = 'A'.
gs_line-col2 = 3.
INSERT gs_line INTO TABLE gt_itab1.
WRITE : 'SUBRC : ', SY-SUBRC.

gs_line-col1 = 'C'.
gs_line-col2 = 4.
INSERT gs_line INTO TABLE gt_itab1.
WRITE : 'SUBRC : ', SY-SUBRC.

* B 1
* A 2
* A 3
* C 4


  "SORTED TABLE
WRITE : / 'SORTED', / .
DATA gt_itab2 LIKE SORTED TABLE OF gs_line WITH UNIQUE KEY col1.

gs_line-col1 = 'B'.
gs_line-col2 = 1.
INSERT gs_line INTO TABLE gt_itab2.
WRITE : 'SUBRC : ', SY-SUBRC.

gs_line-col1 = 'A'.
gs_line-col2 = 2.
INSERT gs_line INTO TABLE gt_itab2.
WRITE : 'SUBRC : ', SY-SUBRC.

gs_line-col1 = 'A'.
gs_line-col2 = 3.
INSERT gs_line INTO TABLE gt_itab2.
WRITE : 'SUBRC : ', SY-SUBRC.

gs_line-col1 = 'C'.
gs_line-col2 = 4.
INSERT gs_line INTO TABLE gt_itab2.
WRITE : 'SUBRC : ', SY-SUBRC.

* A 2
* B 1
* C 4
" 여기서 A 3 가 날라가고 SY-SUBRC에 4가 반환됨

  "HASHED TABLE
WRITE : / 'HASHED', / .
DATA gt_itab3 LIKE HASHED TABLE OF gs_line WITH UNIQUE KEY col1.

gs_line-col1 = 'B'.
gs_line-col2 = 1.
INSERT gs_line INTO TABLE gt_itab3.
WRITE : 'SUBRC : ', SY-SUBRC.

gs_line-col1 = 'A'.
gs_line-col2 = 2.
INSERT gs_line INTO TABLE gt_itab3.
WRITE : 'SUBRC : ', SY-SUBRC.

gs_line-col1 = 'A'.
gs_line-col2 = 3.
INSERT gs_line INTO TABLE gt_itab3.
WRITE : 'SUBRC : ', SY-SUBRC.

gs_line-col1 = 'C'.
gs_line-col2 = 4.
INSERT gs_line INTO TABLE gt_itab3.
WRITE : 'SUBRC : ', SY-SUBRC.

BREAK-POINT.

* B 1
* A 2
* C 4
" 자기 멋대로 정렬함(HASH 에 의해)

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
