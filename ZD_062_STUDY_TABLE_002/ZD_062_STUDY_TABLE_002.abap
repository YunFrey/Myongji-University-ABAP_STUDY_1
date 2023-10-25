&---------------------------------------------------------------------
& Report ZD_062_STUDY_TABLE_002
&---------------------------------------------------------------------
&
&---------------------------------------------------------------------
REPORT ZD_062_STUDY_TABLE_002.

TYPES BEGIN OF s_type,
        no    TYPE c LENGTH 6,
        name  TYPE c LENGTH 10,
        part  TYPE c LENGTH 16,
       END   OF s_type.

DATA gt_itab TYPE STANDARD TABLE OF s_type WITH NON-UNIQUE KEY no WITH HEADER LINE.

gt_itab-no = '0001'.
gt_itab-name = 'EASY ABAP'.
gt_itab-part = 'SAP Team'.

APPEND gt_itab. 담은 한 줄을 테이블에

LOOP AT gt_itab.
  WRITE  gt_itab-no, gt_itab-name, gt_itab-part.
ENDLOOP.

WRITE gt_itab. INTERNAL TABLE 에서도 HEADER LINE 이 있으나 HEADER LINE 도 1차원이라 이대로 출력하면 1개만 나는
cl_demo_output=display( gt_itab ). 출력