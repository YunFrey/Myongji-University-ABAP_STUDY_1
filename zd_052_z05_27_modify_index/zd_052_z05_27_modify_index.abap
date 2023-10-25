*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_27_MODIFY_INDEX
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_27_MODIFY_INDEX.

DATA : BEGIN OF gs_line,
  carrid TYPE sflight-carrid,
  carrname TYPE scarr-carrname,
  fldate TYPE sflight-fldate,
  END OF gs_line.

DATA gt_itab LIKE TABLE OF gs_line.

"일단 carrid 와 fldate 를 gt_itab 에 집어넣음
SELECT carrid fldate INTO CORRESPONDING FIELDS OF TABLE gt_itab FROM sflight.




LOOP AT gt_itab INTO gs_line.
  "gs_line 에 carrname db 에서 불러와서 넣기
  SELECT SINGLE carrname INTO gs_line-carrname
    FROM scarr WHERE carrid = gs_line-carrid.

    "gt_itab 에 업데이트된 gs_line 수정시키기
  MODIFY gt_itab FROM gs_line.
  "MODIFY gt_itab FROm gs_line INDEX sy_tabix 와 같음

  WRITE : / gs_line-carrid, gs_line-carrname.

ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
