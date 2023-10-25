*&---------------------------------------------------------------------*
*& Report ZD_052_Z03_06_JOIN
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z03_06_JOIN.

TYPES : BEGIN OF t_str,
  carrid TYPE sflight-carrid,
  carrname TYPE scarr-carrname,
  END OF t_str.

DATA : gs_str TYPE t_str.

* INNER JOIN 사용하기
SELECT SINGLE a~carrid b~carrname
  INTO CORRESPONDING FIELDS OF gs_str
  FROM sflight AS a
  INNER JOIN scarr AS b
  ON a~carrid = b~carrid
  WHERE a~carrid = 'AA'. "carrid 가 AA인것만 뽑도록 제한

WRITE : gs_Str-carrid, gs_Str-carrname.

*주의! ABAP 에서는 OUTER JOIN 은 LEFT OUTER JOIN 만 사용가능
" 왼쪽 데이터를 기준으로 SELECT 결과가 도출됨
" ex ) 사원 <> 자격증 데이터의 경우 자격증 없는 사원도 표시하게 함

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
