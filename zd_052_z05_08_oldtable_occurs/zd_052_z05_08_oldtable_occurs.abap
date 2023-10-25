*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_08_OLDTABLE_OCCURS
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_08_OLDTABLE_OCCURS.

TYPES : BEGIN OF t_line,
  col TYPE c,
  seq TYPE i,
  END OF t_line.

DATA gt_itab TYPE t_line OCCURS 0 WITH HEADER LINE. " INITIAL SIZE 제한 없음 , WITH HEADER LINE 필수 아님

  gt_itab-col = 'A'.
  gt_itab-seq = '1'.
  INSERT TABLE gt_itab.

  CLEAR gt_itab.
  READ TABLE gt_itab INDEX 1.

  WRITE : / gt_itab-col, gt_itab-seq.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
