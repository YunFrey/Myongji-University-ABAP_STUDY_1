*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_15_ASSUGBITAB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_15_ASSUGBITAB.

TYPES : BEGIN OF t_line,
  col1 TYPE i,
  col2 TYPE i,
  END OF t_line.

DATA : gt_itab1 TYPE STANDARD TABLE OF t_line WITH HEADER LINE,
      gt_itab2 TYPE STANDARD TABLE OF t_line,
      gs_wa LIKE LINE OF gt_itab2.

DO 5 TIMES.
  gt_itab1-col1 = sy-index.
  gt_itab1-col2 = sy-index * 2.
  INSERT TABLE gt_itab1.
  ENDDO.

MOVE gt_itab1[] TO gt_itab2. " itab1 의 데이터 BODY 를 itab2 에 옮기기
"gt_itab1 은 헤더라인이 있는 테이블이며 gt_itab2는 헤더라인이 없는 테이블임
"gt_itab1의 데이터를 2에 옮기기 위해 테이블의 Body 만 옮기는 거임

LOOP AT gt_itab2 INTO gs_wa.
  WRITE : / gs_wa-col1, gs_wa-col2.
ENDLOOP.

"그래도 gt_itab2는 헤더라인이 없어서 아래처럼 읽지는 못함

READ TABLE gt_itab1 INDEX 1. "gt_itab 테이블의 INDEX 1(첫줄)을 읽어서 메모리에 올리기
WRITE : / gt_itab1-col1, gt_itab1-col2. "HEADER LINE 을 통해 출력

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
