*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_19_INSERT_TO_TABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_19_INSERT_TO_TABLE.

* [테이블에 레코드 추가]
 " INSERT <LINE> INTO TABLE <itab>
 " 성공 시 SY-SUBRC 에 0이 반환됨. ( IF SY-SUBRC = 0 일 경우를 지정가능)
 " 만약 UNIQUE KEY인데 같은 걸 추가했다면 SY-SUBRC = 4 가 나옴

* [ 테이블에 여러 레코드 추가]
 " INSERT LINES OF <itab> FROM <n1> TO <n2> INTO TABLE <itab2>.

* <예제>
DATA : BEGIN OF gs_line,
  col1 TYPE c,
  col2 TYPE i,
  END OF gs_line.

DATA gt_itab1 LIKE STANDARD TABLE OF gs_line WITH NON-UNIQUE KEY col1.
DATA gt_itab2 LIKE SORTED TABLE OF gs_line WITH NON-UNIQUE KEY col1.

gs_line-col1 = 'B'.
gs_line-col2 = 1.
INSERT gs_line INTO TABLE gt_itab1.

gs_line-col1 = 'A'.
gs_line-col2 = 2.
INSERT gs_line INTO TABLE gt_itab1.

gs_line-col1 = 'C'.
gs_line-col2 = 3.
INSERT gs_line INTO TABLE gt_itab1.


*여기서부터 여러개 한번에 추가
* MOVE gt_itab1 TO gt_itab2. "이거랑 비슷한 구문

INSERT LINES OF gt_itab1 INTO TABLE gt_itab2.
" INSERT LINES OF gt_itab1 FROM 1 TO 2 INTO TABLE gt_itab2. "gt_itab1 의 1,2행만 넣기
" INSERT LINES OF gt_itab1 FROM 1 TO 2 INTO TABLE gt_itab2 2. "gt_itab2 의 2번째 Index 에 gt_itab1의 1,2행을 껴넣기

LOOP AT gt_itab2 INTO gs_line.
  WRITE : / gs_line-col1, gs_line-col2.
ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
