*&---------------------------------------------------------------------*
*& Report ZD_052_STUDY_TABLE_001
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_STUDY_TABLE_001.
TYPES: BEGIN OF s_type,
        no    TYPE c LENGTH 6,
        name  TYPE c LENGTH 10,
        part  TYPE c LENGTH 16,
       END   OF s_type.

"TYPE TABLE OF 으로 가져와도 된다
" 추후 SORTED 테이블 HASHED 테이블 구문에 사용하기 위해 no 칼럼을 NON-UNIQUE KEY 로 지정하였다.
" WITH HEADER LINE 을 사용하여 변수에다 직접 INTERNAL TABLE에 꽂아넣어 줄 수 있음
" STANDARD TABLE 은 NON-UNIQUE KEY
DATA gt_itab TYPE STANDARD TABLE OF s_type WITH NON-UNIQUE KEY no WITH HEADER LINE.

"HEADER LINE 이 있어서 아래와 같이 INTERNAL TABLE 에 값을 입력할 수 있다.
gt_itab-no = '0001'.
gt_itab-name = 'EASY ABAP'.
gt_itab-part = 'SAP Team'.

APPEND gt_itab.

LOOP AT gt_itab.
  WRITE : gt_itab-no, gt_itab-name, gt_itab-part.
ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
