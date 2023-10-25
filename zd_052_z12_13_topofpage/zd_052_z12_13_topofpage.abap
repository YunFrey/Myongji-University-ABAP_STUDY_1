*&---------------------------------------------------------------------*
*& Report ZD_052_Z12_13_TOPOFPAGE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z12_13_TOPOFPAGE.

TOP-OF-PAGE.
  WRITE : sy-title, 60 'Page no:', sy-pagno.
  ULINE.
  WRITE: / 'Enjoy ABAP', sy-datum.
  ULINE.

START-OF-SELECTION.
  DO 50 TIMES.
    WRITE / sy-index.
  ENDDO.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
