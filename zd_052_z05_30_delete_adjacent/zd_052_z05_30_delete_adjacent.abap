*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_30_DELETE_ADJACENT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_30_DELETE_ADJACENT.

* [ADJACENT DUPLICATE 를 이용한 중복 라인 삭제]
" 주의 : 수행 이전에 SORT 로 테이블 정렬해야함

DATA : BEGIN OF gs_line,
  carrid TYPE sflight-carrid,
  connid TYPE sflight-connid,
  END OF gs_line.

DATA gt_itab LIKE TABLE OF gs_line WITH HEADER LINE.

SELECT carrid connid INTO CORRESPONDING FIELDS OF TABLE gt_itab FROM sflight.

"중복 제거 (애초에 넣은 게 중복돼서 필요없음)
DELETE ADJACENT DUPLICATES FROM gt_itab.

LOOP AT gt_itab.
  WRITE : / gt_itab-carrid, gt_itab-connid.
ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
