*&---------------------------------------------------------------------*
*& Report ZD_052_Z03_07_OUTERJOIN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z03_07_OUTERJOIN.

TYPES : BEGIN OF t_str,
  carrid TYPE sflight-carrid,
  carrname TYPE scarr-carrname,
  END OF t_Str.

DATA : gs_str TYPE t_str.

SELECT SINGLE a~carrid b~carrname
  INTO CORRESPONDING FIELDS OF gs_str
  FROM sflight AS a
  LEFT OUTER JOIN scarr AS b
  ON a~carrid = b~carrid
  WHERE a~carrid = 'AA'.

WRITE : gs_str-carrid, gs_str-carrname.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
