*&---------------------------------------------------------------------*
*& Report ZD_052_Z03_10_FORALLENTRIES
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z03_10_FORALLENTRIES.

DATA gt_sflight TYPE TABLE OF sflight.
DATA gt_spfli TYPE TABLE OF spfli.
DATA gs_sflight TYPE sflight.

* [FOR ALL ENTRY 사용예시]
" 불러온 Internal Table 과 DB 테이블을 JOIN 하는 것과 유사

*spfli 의 정보를 gt_spflight 에 넣기
  SELECT * FROM spfli
    INTO TABLE gt_spfli.

* OPEN SQL 방식의 JOIN(TABLE vs TABLE)
SELECT * FROM SFLIGHT
  INTO TABLE gt_sflight
  FOR ALL ENTRIES IN gt_spfli
  WHERE carrid = gt_spfli-carrid
    AND connid = gt_spfli-connid.
  "모든 엔트리에 대해 gt_sflight 와 gt_spfli 를 carrid 키로 조인함

*여기서부턴 출력부
LOOP AT gt_sflight INTO gs_sflight.
    WRITE : / gs_sflight-carrid, gs_sflight-connid.
ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
