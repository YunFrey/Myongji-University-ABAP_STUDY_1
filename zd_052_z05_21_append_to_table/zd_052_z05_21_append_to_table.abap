*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_21_APPEND_TO_TABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_21_APPEND_TO_TABLE.

* [APPEND 구문을 이용한 LINE 추가]

* [라인 1개 추가[
 " APPEND <LINE> TO <itab>
 " 이때 itab 에 추가된 LINE 의 INDEX 가 SY-TABIX 에 return 됨

* [라인 여러개 추가]
 " APPEND LINES OF <itab1> FROM <n1> TO <n2> TO <itab2>

DATA : BEGIN OF gs_line,
  col1 TYPE c,
  col2 TYPE n,
  END OF gs_line.

 DATA gt_itab LIKE STANDARD TABLE OF gs_line WITH NON-UNIQUE KEY col1.
*DATA gt_itab LIKE SORTED TABLE OF gs_line WITH UNIQUE KEY col1. "이건 APPEND 사용불가 INSERT 써야함 그래야 테이블에서 알아서 정렬함
*DATA gt_itab LIKE HASHED TABLE OF gs_line WITH UNIQUE KEY col1.

gs_line-col1 = 'B'.
gs_line-col2 = 1.
APPEND gs_line TO gt_itab.

gs_line-col1 = 'A'.
gs_line-col2 = 2.
APPEND gs_line TO gt_itab.

gs_line-col1 = 'A'.
gs_line-col2 = 3.
APPEND gs_line TO gt_itab.

gs_line-col1 = 'C'.
gs_line-col2 = 4.
APPEND gs_line TO gt_itab.

BREAK-POINT.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
