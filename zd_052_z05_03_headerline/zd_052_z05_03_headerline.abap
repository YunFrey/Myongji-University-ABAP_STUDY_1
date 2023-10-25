*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_03_HEADERLINE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_03_HEADERLINE.

TYPES : BEGIN OF t_str,
  col1 TYPE i,
  col2 TYPE i,
END OF t_str.

DATA gt_itab TYPE TABLE OF t_str WITH HEADER LINE. "t_str 구조체로 gt_itab 헤더라인 있는 인터널 테이블 생성

DO 3 TIMES.     " 3번 반복
  gt_itab-col1 = sy-index.      "INDEX 번호
  gt_itab-col2 = sy-index ** 2. "INDEX 번호 제곱 2
  APPEND gt_itab.               "gt_itab 인터널 테이블에 추가 (HEADER LINE이 있기에 불필요
  "APPEND gt_itab TO gt_itab 와 같음
  "HEADER LINE 없으면 t_str 타입으 로 work area 만들고
  "APPEND gs_wa TO gt_itab 해야함
ENDDO.

LOOP AT gt_itab.
  WRITE : / gt_itab-col1, gt_itab-col2.
ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
