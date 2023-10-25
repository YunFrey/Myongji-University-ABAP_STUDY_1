*&---------------------------------------------------------------------*
*& Report ZD_052_Z03_05_FROMTABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z03_05_FROMTABLE.

* FROM 구문 사용법
" FROM ... INNER JOIN 가능
" FROM <TABLE> AS A
" FROM (TABLE)


* FROM 구문에서 사용할 수 있는 옵션
" SELECT ... FROM <TABLE> AS A <Options>
" CLIENT SPECIFIED : 클라이언트 지정
" BYPASSING BUFFER : 버퍼링 안하고 DB에서 갖옴
" UP TO n ROWS : SELECT 시 가져올 레코드 제한

*[정적 SELECT]
" SELECT ... FROM <TABLE>

*[동적 SELECT]
" ㄴ띠ㄸㅊㅆ ... FROM (TABLE변수)

PARAMETERS p_tname TYPE char10. " 10짜리 글자를 받은 p_tname 이라는 빈칸 생성
DATA GS_WA TYPE SFLIGHT.

SELECT SINGLE * INTO gs_wa FROM (p_tname) WHERE carrid = 'AA'.
"출력 시 sflight 라고 하면 그걸 받음

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
