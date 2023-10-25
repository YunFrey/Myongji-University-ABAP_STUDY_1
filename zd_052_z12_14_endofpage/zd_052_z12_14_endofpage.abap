*&---------------------------------------------------------------------*
*& Report ZD_052_Z12_14_ENDOFPAGE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z12_14_ENDOFPAGE LINE-COUNT 10(2).

TOP-OF-PAGE.
  WRITE: 'Top of Page'.
  ULINE AT /(60).
END-OF-PAGE.
  ULINE.
  WRITE: /30 'Page no :', sy-pagno.

START-OF-SELECTION.
  DO 20 TIMES.
    WRITE / sy-index.
  ENDDO.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
