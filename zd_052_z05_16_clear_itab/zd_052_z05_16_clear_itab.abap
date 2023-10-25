*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_16_CLEAR_ITAB
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_16_CLEAR_ITAB.

"[인터널 테이블 삭제하기]
" CLEAR itab 시 itab 이 헤더라인이 있으면 헤더라인만 날라감, BODY 를 나리려면 CLEAR itab[] 로 해야함
" 비슷한 구문 : REFRESH itab

" [ CLEAR vs REFRESH ]
" CLEAR : 메모리 공간 반환, 단 INITIAL VALUE (초깃값)은 그대로
" REFRESH : 인터널 테이블 정보는 삭제, 단 메모리 차지는 그대로, 추후 free <ITAB> 을 이용해 메모리도 정리해야함

DATA : BEGIN OF gs_line,
  col1 TYPE i,
  col2(1) TYPE c,
  END OF gs_line.

DATA : gt_itab LIKE STANDARD TABLE OF gs_line.

gs_line-col1 = 1.
gs_line-col2 = 'A'.
INSERT gs_line INTO TABLE gt_itab.

REFRESH gt_itab.
* 추후 메모리 반환을 위해 FREE itab 필요함.
* REFRESH + FREE = CLEAR itab

IF gt_itab is INITIAL.
  WRITE : '인터널 테이블은 초기값 상태임'.
  FREE gt_itab.
ENDIF.


* 주의 만약 HEADER LINE 이 있는 Internal table 이면?

DATA : gt_itab2 LIKE STANDARD TABLE OF gs_line WITH HEADER LINE.
gs_line-col1 = 1.
gs_line-col2 = 'A'.
INSERT gs_line INTO TABLE gt_itab2.

REFRESH gt_itab2. "헤더라인만 삭제
REFRESH gt_itab2[]. "BODY 도 삭제

IF gt_itab2 is INITIAL.
  WRITE : / '인터널 테이블은 초기값 상태임'.
  FREE gt_itab2.
  FREE gt_itab2[].
ENDIF.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
