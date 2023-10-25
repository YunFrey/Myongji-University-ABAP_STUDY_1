*&---------------------------------------------------------------------*
*& Report ZD_052_Z03_11_GROUPBY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z03_11_GROUPBY.

DATA : gv_carrid TYPE sflight-carrid,
      gv_connid TYPE sflight-connid,
      gv_paymentsum TYPE i.

SELECT carrid connid AVG( paymentsum )"paymentsum 추가
  INTO (gv_carrid, gv_connid, gv_paymentsum)
  FROM sflight GROUP BY carrid connid.
  WRITE : / gv_carrid, gv_connid, gv_paymentsum.
ENDSELECT.

* TIP
WRITE / '[CORRESPONDING TABLE]'.
" SQL에서 SUM 이용해서 INTO CORERESPONDING FIELDS OF TABLE
"사용시 결과를 못가져오므로 AS PRICE 라는 Alias 별칭을 사용했다.

"+ GROUP BY 절에서 SUM( PRICE ) 를 가져오지 못하므로 Alias 한 별칭으로 참조가능

BREAK-POINT.

DATA gt_glt TYPE TABLE OF sflight INITIAL SIZE 100.
DATA gs_wa TYPE sflight.

SELECT CARRID SUM( PRICE ) AS PRICE
  FROM sflight
  INTO CORRESPONDING FIELDS OF TABLE gt_glt
  WHERE carrid = 'AA'
  GROUP BY CARRID.

LOOP AT gt_glt INTO gs_wa.
  WRITE : / gs_wa-carrid, gs_wa-price.
ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
