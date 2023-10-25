*&---------------------------------------------------------------------*
*& Report ZD_052_Z03_13_SCALARSUBQ
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z03_13_SCALARSUBQ.

*SCALAR SUBQUERY
"서브쿼리는 여기서 한 칼럼만을 반환해야함

DATA: gv_carrid TYPE sflight-carrid,
      gv_connid TYPE sflight-connid,
      gv_paymentsum TYPE sflight-paymentsum.

SELECT SINGLE carrid connid paymentsum
  INTO (gv_carrid, gv_connid, gv_paymentsum)
  FROM sflight AS a
  WHERE carrid IN ( SELECT carrid FROM spfli WHERE carrid = a~carrid AND connid = a~connid )
AND a~carrid = 'AA'.
*여기서 carrid와 connid 가 AA인 칼럼과 메인쿼리에서 반환될 carrid 와 connid 1개만 반환될 것임(SELECT SINGLE임)

WRITE : gv_carrid, gv_connid, gv_paymentsum.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
