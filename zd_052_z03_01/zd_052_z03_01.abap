*&---------------------------------------------------------------------*
*& Report ZD_052_Z03_01
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z03_01.

* OPEN SQL : 데이터 읽기
* 데이터 명령어의 종류 : SELECT, UPDATE, MODIFY, DELETE
" MODIFY 특징 : 중복되면 UPDATE 하고 없으면 INSERT 함

" [SELECT 문] : SELECT...INTO...FROM...WHERE...GROUP BY... HAVING... ORDER BY
*만약 한 레코드만 읽을 경우 (WHERE 조건이 명확해야함, 아니면 임의로 가져옴)
" SELECT SINGLE ...

"여러 라인을 읽어서 Internal TAble 에 저장할 경우
" SELECT ... WHERE
" SELECT DISTINCT ... WHERE

"만약 필드 or Work Area 에 저장할 경우(반복이 필요)
" SELECT ... WHERE ...
" ENDSELECT


"[밑에 코드 이전에 구조체만 선언함]
DATA : gt_itab TYPE STANDARD TABLE OF sflight,
      gs_wa TYPE sflight. "sflight 의 열 형식을 따른 Work Area 생성







* 아래 구문은 구조체에 데이터를 넣어 반복적 출력하기 (비효율적)
"비효율적인 이유 : Work Area 에 한줄씩 넣을 때마다 DB를 조회하기 때문

" SELECT 문 시작
SELECT * INTO gs_wa FROM sflight "sflight 에서 데이터 읽어서 Work Area 에 모든 거 넣기(한줄씩 넣음)
  WHERE carrid = 'AA'. "그중 carrid가 AA인 레코드를 가져옴
  WRITE : / gs_wa-carrid, gs_wa-connid. " 엔터치고 gs_wa의 carrid 칼럼과 connid 칼럼을 가져옴
ENDSELECT.






* 아래 구문은 인터널 테이블에 데이터를 통째로 넣고 Work Area 로 출력하는 모습
WRITE : / '[인터널 테이블 형식]'.

SELECT * INTO TABLE gt_itab FROM sflight
  WHERE carrid = 'AA'.

LOOP AT gt_itab INTO gs_wa. "인터널 테이블의 한 줄씩 Work Area 로 로드
  WRITE : / gs_wa-carrid, gs_wa-connid. "Work Area 내용을 출력
ENDLOOP.

*위 두개 무슨 차이?
"DB에서 한줄씩 Work Area로 읽어서 출력하는걸 반복
"DB에서 Internal Table 로 넣고 Work Area 로 테이블을 한줄씩 읽음

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
