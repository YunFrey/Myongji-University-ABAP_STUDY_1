*&---------------------------------------------------------------------*
*& Report ZD_052_Z03_01_DYNAMICSELECT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z03_01_DYNAMICSELECT.

DATA : gt_itab TYPE STANDARD TABLE OF sflight,
      gs_wa LIKE LINE OF gt_itab. "TYPE sflight 로 하면 여러개를 못읽음

DATA : gs_line TYPE c LENGTH 72. "동적 변수는 72자까지 넣을 수 있음

gs_line = 'CARRID CONNID'. "동적 변수에 칼럼 리스트 저장

BREAK-POINT.

"[데이터 gt_itab 에 저장[
SELECT DISTINCT (gs_line) INTO CORRESPONDING FIELDS OF TABLE gt_itab FROM sflight. "gs_line 은 동적이기에 () 라고 해야 묶임
  " SELECT DISTINCT CARRID CONNID INTO TABLE gt_itab FROM sflight 와 같음

"[데이터 읽기]
  IF SY-SUBRC = 0.
    LOOP AT gt_itab INTO gs_wa.
      WRITE : / gs_wa-carrid, gs_wa-connid.
    ENDLOOP.
  ENDIF.

  BREAK-POINT.

* 만약 칼럼이 72자 이상일 경우 인터널 테이블 선언
  DATA gt_list LIKE TABLE OF gs_line(72). "gs_line을 테이블 형태로 선언
  gs_line = 'CARRID CONNID'.
  APPEND gs_line TO gt_list. "gs_line 에 덧대기

  SELECT DISTINCT (gt_list) INTO TABLE gt_itab FROM sflight. "gt_list 로 호출

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
