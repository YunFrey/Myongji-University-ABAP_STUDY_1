*&---------------------------------------------------------------------*
*& Report ZD_052_STUDY_TABLE_001_EDIT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_STUDY_TABLE_001_EDIT.

TYPES: BEGIN OF s_type,
        no    TYPE c LENGTH 6, "문자열 20개, Space도 하나의 칸으로 인식
        name  TYPE c LENGTH 10,
        part  TYPE c LENGTH 16,
       END   OF s_type.

"SAP 버전이 HANA로 업그레이드 되면서 HEADER LINE 권장 x
"-> structure를 따로 선언해야함.
DATA: gs_wa   TYPE s_type, "gs: global sturcutre / wa: work area의 줄임말
      gt_itab LIKE TABLE OF gs_wa. "gt: global table / LIKE: 앞서 Structure와 동일한 구조로 itab 선언

gs_wa-no = '0001'. "HEADER LINE이 없으므로 Table이 아닌 Structrue에 담아주어야 한다.
gs_wa-name = 'EASY ABAP'.
gs_wa-part = 'SAP Team'.

"Internal Table은 INSERT 또는 APPEND 구문을 사용하여 Line이 추가될 때마다 메모리에 Load 한다.
APPEND gs_wa TO gt_itab. "APPEND: itab의 맨 마지막 라인에 담김. (INSERT: 차례대로 값 추가)
CLEAR gs_wa. "structure 사용 후 CLEAR로 비워주는 게 좋다.

gs_wa-no = '0002'. "HEADER LINE이 없으므로 Table이 아닌 Structrue에 담아주어야 한다.
gs_wa-name = '1Q84'.
gs_wa-part = 'Hideoshi'.
INSERT gs_wa INTO TABLE gt_itab. "" APPEND 는 마지막 레코드에만 삽입하고 INDEX는 INDEX를 지정해서 지정한 줄 밑에 레코드를 삽입한다

cl_demo_output=>display( gt_itab ). "출력

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
