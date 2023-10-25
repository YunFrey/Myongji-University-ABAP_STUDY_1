*&---------------------------------------------------------------------*
*& Report ZD_052_Z03_12_ORDERBY
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z03_12_ORDERBY.

DATA: gv_carrid TYPE sflight-carrid,
      gv_connid TYPE sflight-connid,
      gv_paymentsum TYPE i.

SELECT carrid connid AVG( paymentsum ) AS paymentsum
  INTO (gv_carrid, gv_connid, gv_paymentsum)
  FROM sflight
  GROUP BY carrid connid
  ORDER BY paymentsum.
  WRITE : / gv_carrid, gv_connid, gv_paymentsum.
ENDSELECT.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
