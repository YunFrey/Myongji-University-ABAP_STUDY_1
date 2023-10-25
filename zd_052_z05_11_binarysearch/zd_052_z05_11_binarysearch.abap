*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_11_BINARYSEARCH
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_11_BINARYSEARCH.


TYPES : BEGIN OF line,
  col1 TYPE i,
  col2 TYPE i,
  col3 TYPE i,
END OF line.

DATA itab TYPE STANDARD TABLE OF line WITH key COL1 with header line.

DO 10000000 TIMES.
  itab-col1 = sy-index.
  itab-col2 = sy-index.
  itab-col3 = sy-index.
  INSERT TABLE itab.
ENDDO.

SORT itab BY col1 col2 col3.

*일반 SEARCH
READ TABLE itab WITH KEY col1 = 5000 col2 = 100 col3 = 999999.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
