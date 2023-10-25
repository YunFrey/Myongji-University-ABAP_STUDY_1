*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_26_MODIFY_WHERE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_26_MODIFY_WHERE.

DATA : BEGIN OF gs_line,
  carrid TYPE sflight-carrid,
  carrname TYPE scarr-carrname,
  fldate TYPE sflight-fldate,
END OF gs_line.

DATA gt_itab LIKE TABLE OF gs_line.

"먼저 carrid 와 connid 를 gt_itab 에 다 넣기
SELECT carrid fldate INTO CORRESPONDING FIELDS OF TABLE gt_itab FROM sflight.

  " AT FIRST : 인터널 테이블의 첫번째 값이 실행될 때 수행됨
  " AT NEW <column> : 해당 칼럼에 새로운 값이 들어올 때 수행된다.
    "만약 column 값이 AA AA AA AD 로 바뀔 경우 AT NEW 안의 게 실행됨
  " AT END OF <column> : 칼럼 f1의 값이 마지막일 때 수행된다.
  " AT LAST : 인터널 테이블의 마지막 값이 실행될 때 수행된다.

LOOP AT gt_itab INTO gs_line.
  AT NEW carrid. "carrid 에 새로운 값이 들어올 때 수행됨
    "DB에서 데이터 한줄 읽어오기
    SELECT SINGLE carrname INTO gs_line-carrname "carrname 칼럼을 gs_line 에 넣기
      FROM scarr WHERE carrid = gs_line-carrid.

     "gt_itab 의 carrname 에 gs_line 에 넣어둔 것중 carrname 칼럼을  붙여넣기
      MODIFY gt_itab FROM gs_line TRANSPORTING carrname
      WHERE carrid = gs_line-carrid.
  ENDAT.

WRITE : / gs_line-carrid, gs_line-carrname.
ENDLOOP.

BREAK-POINT.

* 테이블 읽어보기
DATA : BEGIN OF gs_wa,
  carrid TYPE sflight-carrid,
  carrname TYPE scarr-carrname,
  connid TYPE sflight-connid,
  fldate TYPE sflight-fldate,
END OF gs_wa.

LOOP AT gt_itab INTO gs_wa.
  WRITE : / gs_wa-carrid, gs_wa-carrname, gs_wa-connid.
ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
