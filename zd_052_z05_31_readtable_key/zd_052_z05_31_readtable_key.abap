*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_31_READTABLE_KEY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_31_READTABLE_KEY.

DATA : BEGIN OF gs_line,
  carrid TYPE scarr-carrid,
  carrname TYPE scarr-carrname,
  END OF gs_line.

DATA gt_itab LIKE TABLE OF gs_line WITH NON-UNIQUE KEY carrid.

SELECT carrid carrname
  INTO CORRESPONDING FIELDS OF TABLE gt_itab FROM scarr.

gs_line-carrid = 'AA'.

"gs_line 구조체에 저장된 AA 조건으로부터 테이블 읽기
READ TABLE gt_itab FROm gs_line INTO gs_line.
WRITE : / gs_line-carrid, gs_line-carrname.

" 새로운 거 읽기 전에 클리어
CLEAR : gs_line.

"이건 구조체가 아닌 KEY 지정해서 AB가 carrid 인걸로 불러와 gs_line 에 저장
READ TABLE gt_itab WITH TABLE KEY carrid = 'AB' INTO gs_line.
WRITE : / gs_line-carrid, gs_line-carrname.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
