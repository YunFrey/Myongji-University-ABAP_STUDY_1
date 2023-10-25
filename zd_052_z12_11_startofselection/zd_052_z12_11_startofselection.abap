*&---------------------------------------------------------------------*
*& Report ZD_052_Z12_11_STARTOFSELECTION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z12_11_STARTOFSELECTION.

DATA : g_total TYPE i,
      g_cnt TYPE i,
      g_index TYPE i.

DATA : gt_sflight TYPE TABLE OF sflight WITh HEADER LINE.

* 이 구간에 INITIALIZATION 및 AT SELECTION-SCREEN 등 필드 초기화 및 조정 및 제어 구문이 들어감

START-OF-SELECTION. "데이터 DB에서 읽어오기 시작
  SELECT *
    INTO CORRESPONDING FIELDS OF TABLE gt_sflight
    FROM sflight.

    DESCRIBE TABLE gt_sflight LINES g_total. "gt_sflight 테이블을 g_total

    LOOP AT gt_sflight.
      g_cnt = g_cnt + 1.
      " 로딩 상태정보 추가
      PERFORM progress_indicator USING g_cnt g_total ' 처리중 ... '.

    ENDLOOP.
END-OF-SELECTION.

    WRITE '성공'.


* 여기서부턴 progress_indicator FUNCTION 내용
FORM progress_indicator USING value(p_cur) value(p_total) value(p_text).
"처리 라인에 따라 퍼센티지를 표현하기 위한 과정
DATA : lv_text(50) TYPE c,
      lv_idx(3) TYPE n.
lv_idx = ( p_cur / p_total ) * 100.
CONCATENATE lv_idx ' % : ' p_text INTO lv_text.
"SAPGUI_PROGRESS_INDICATOR FUNCTION 에 해당 값 집어넣어 표시
CALL FUNCTION
  'SAPGUI_PROGRESS_INDICATOR'
  EXPORTING
    percentage = lv_idx
    text = lv_text
  EXCEPTIONS
    others = 0.
ENDFORm.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
