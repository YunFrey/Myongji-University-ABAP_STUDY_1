*&---------------------------------------------------------------------*
*& Report ZD_052_Z03_14_NONSCALARSUBQ
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z03_14_NONSCALARSUBQ.

DATA: gv_carrid TYPE sflight-carrid,
      gv_connid TYPE sflight-connid,
      gv_paymentsum TYPE sflight-paymentsum.

SELECT SINGLE carrid connid paymentsum
  INTO (gv_carrid, gv_connid, gv_paymentsum)
  FROM sflight AS a
  WHERE EXISTS ( SELECT * FROM spfli WHERE carrid = a~carrid AND connid = a~connid )
  AND a~carrid = 'AA'.
  "이건 TRUE 값이니 그냥 a~carrid 가 AA인거 하나만 뽑음

WRITE: gv_carrid, gv_connid, gv_paymentsum.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
