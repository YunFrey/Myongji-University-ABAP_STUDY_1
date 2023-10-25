*&---------------------------------------------------------------------*
*& Report ZD_052_Z03_09_DYNAMICWHEREMUL
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z03_09_DYNAMICWHEREMUL.

DATA gs_where(72) TYPE c.
DATA gt_where LIKE TABLE OF gs_where.
DATA gv_carrname TYPE scarr-carrname.
DATA gv_carrid1 TYPE scarr-carrid VALUE 'AC'.
DATA gv_carrid2 TYPE scarr-carrid VALUE 'AF'.

* AC 와 AF 두개 조건인 거를 동적변수로 WHERE 구문에 집어넣기

" Air Canada 의 CARRID 를 부름
CONCATENATE 'CARRID = ''' gv_carrid1 '''' INTO gs_where.
APPEND gs_where TO gt_where.

" OR 를 추가해 CARRID = 'gv_carrid1' OR CARRID = 'gv_carrid2' 로 하게함
gs_where = 'OR'.
APPEND gs_where TO gt_where.

" Air France  의 CARRID 를 부름
CONCATENATE 'CARRID = ''' gv_carrid2 '''' INTO gs_where.
APPEND gs_where TO gt_where.

SELECT carrname
  INTO gv_carrname
  FROM scarr
  WHERE (gt_where).

  WRITE / gv_carrname.
ENDSELECT.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
