*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_18_DESCRIBE_TABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_18_DESCRIBE_TABLE.


DATA: BEGIN OF gs_line,
  col1 TYPE c,
  col2 TYPE i,
  END OF gs_line.

DATA gt_itab LIKE STANDARD TABLE OF gs_line INITIAL SIZE 10.

DATA : gv_line TYPE i. "인터널 테이블에 존재하는 라인 수를 반환받을 변수(Integer 타입)
DATA : gv_occurs TYPE i. "인터널 테이블에 존재하는 라인 수를 반환받을 변수(Integer 타입)
DATA : gv_kind TYPE c. "인터널 테이블에 존재하는 라인 수를 반환받을 변수(Integer 타입)

DO 20 TIMES.
  gs_line-col1 = SY-INDEX.
  gs_line-col2 = SY-INDEX * 2.
  INSERT gs_line INTO TABLE gt_itab.
ENDDO.

DESCRIBE TABLE gt_itab LINES gv_line OCCURS gv_occurs KIND gv_kind.

WRITE : / '인터널 테이블 라인 : ', gv_line, / '인터널 테이블 의 초기 라인 수 :', gv_occurs, / '인터널 테이블의 속성 : ', gv_kind.

" Standard : T
" Sorted : S
" Hashed : H

* 인터널 테이블에 LINE 삽입하는 명령어 (INSERT, APPEND, COLLECT)
" INSERT : STANDARD TABLE 에 주로 사용, 마지막 라인에 데이터 삽입
" COLLECT : 같은 키끼리 SUM 을 수행해 합침, 없으면 새로 추가

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
