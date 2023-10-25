*&---------------------------------------------------------------------*
*& Report ZD_052_Z01_WORKAREA
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z01_WORKAREA.

* INTO 구문

* [Work Area 에 INTO 하기]
" 한 라인을 조회할 때 사용
" SELECT ... INTO CORRESPONDING FIELDS OF <Work Area>

* [CORRESPONDING FIELDS OF]
" Work Area 에 A B C 칼럼이 있고 불러온게 A C D 면
" Work Area 에 A C 만 업데이트됨

* [Internal Table에 INTO 하기]
" 여러 라인을 조회할 때 사용
" SELECT ... INTO TABLE <인터널테이블> PACKAGE SIZE <숫자>

*[Package Size 는?]
" 인터널 테이블에 몇 라인을 추가할지 결정함 (이땐 SELECT...ENDSELECT 로 끝나야함)

DATA : gs_wa TYPE sflight,
      gt_itab TYPE TABLE OF sflight.

SELECT carrid connid FROM spfli INTO CORRESPONDING FIELDS OF TABLE gt_itab
PACKAGE SIZE 5.
  LOOP AT gt_itab INTO gs_wa.
    WRITE : / gs_wa-carrid, gs_wa-connid.
  ENDLOOP.
ENDSELECT.

** 위 경우 5개의 값을 가져와 LOOP를 수행함
** sflight 와 spfli 테이블은 다른 구조라 CORRESPONDING FIELDS OF 를 써야함


* INTO 구문에 여러 개를 넣을 경우

DATA : gv_carrid TYPE sflight-carrid,
      gv_connid TYPE sflight-connid.

SELECT carrid connid INTO (gv_carrid, gv_connid) FROM sflight.
  ENDSELECT.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
