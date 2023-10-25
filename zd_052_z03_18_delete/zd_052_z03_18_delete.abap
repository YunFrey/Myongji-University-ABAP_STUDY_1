*&---------------------------------------------------------------------*
*& Report ZD_052_Z03_18_DELETE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z03_18_DELETE.

DATA gt_spfli TYPE TABLE OF spfli.
DATA gs_spfli TYPE spfli.
gs_spfli-carrid = 'KO'.
gs_spfli-connid = '0001'.
gs_spfli-cityfrom = 'Seoul'.
APPEND gs_spfli TO gt_spfli.
DELETE spfli FROM TABLE gt_spfli.

BREAK-POINT.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
