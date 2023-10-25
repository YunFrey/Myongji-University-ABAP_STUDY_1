*&---------------------------------------------------------------------*
*& Report ZD_052_Z03_08_DYNAMICWHERE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z03_08_DYNAMICWHERE.

DATA gs_where(72) TYPE c.
DATA gv_carrname TYPE scarr-carrname.
DATA gv_carrid TYPE scarr-carrid VALUE 'AC'.

CONCATENATE 'CARRID = ''' gv_carrid '''' INTO gs_where.
" CARRID = 'gv_carrid'

SELECT SINGLE carrname
  INTO gv_carrname
  FROM scarr
  WHERE (gs_where). "CARRID 가 AC인 scarr 의 carrname 칼럼을 1개 가져옴

WRITE : / gv_carrname.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
