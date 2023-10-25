*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_03_HEADERLINE_BONUS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_03_HEADERLINE_BONUS.

*헤더라인이 없을 때 구현방법
TYPES : BEGIN OF t_str,
  col1 TYPE i,
  col2 TYPE i,
END OF t_str.

* Work Area 생성
DATA gs_wa TYPE t_str.


DATA gt_itab TYPE TABLE OF t_str. "t_str 구조체로 gt_itab 헤더라인 없는  인터널 테이블 생성

DO 3 TIMES.     " 3번 반복
  gs_wa-col1 = sy-index.      "INDEX 번호
  gs_wa-col2 = sy-index ** 2. "INDEX 번호 제곱 2
  APPEND gs_wa TO gt_itab.               "gs_wa의 내용을 gt_itab에 추가
ENDDO.

LOOP AT gt_itab INTO gs_wa.
  WRITE : / gs_wa-col1, gs_wa-col2.
ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
