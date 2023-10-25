*&---------------------------------------------------------------------*
*& Report ZD_052_Z05_05_STANDARDTABLE
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z05_05_STANDARDTABLE.

* [Internal Table 종류]
" STANDARD TABLE : INDEX가 순차적(INDEX 서칭 유리), 트리구조,
"   INDEX란? : 테이블에서 데이터가 위치한 순번
"   STANDARD TABLE 주의 : 키를 NON-UNIQUE 로 해야함
" SORTED TABLE
" HASHED TABLE

* [Internal Table 예시]

**1. STRUCTURE TYPE 선언
TYPES : BEGIN OF t_line, " <t_line>
  field1(5) TYPE c,      " | field1 | field2 | field3 |
  field2(4) TYPE c,
  field3 TYPE i,
END OF t_line.

**2. Standard Table 타입 선언
TYPES t_tab TYPE STANDARD TABLE OF t_line WITH NON-UNIQUE DEFAULT KEY.
"<t_tab 예시>
"| field1 | field2 | field3 |
"| field1 | field2 | field3 |
" ...

**3. Internal Table 선언
DATA gt_itab TYPE t_tab WITH HEADER LINE. "Standard Table 이용해서 Internal  Table 생성
"인터널 테이블에 정보 입력
gt_itab-field1 = 'Enjoy'.
gt_itab-field2 = 'ABAP'.
gt_itab-field3 = 1.
"헤더라인을 이용해 테이블에 레코드 하나 업뎃하기
APPEND gt_itab. "APPEND gt_itab TO gt_itab 와 같음

**4. Internal Table 읽기
READ TABLE gt_itab INDEX 1. "gt_itab 테이블의 INDEX 1(첫줄)을 읽어서 메모리에 올리기
WRITE : / gt_itab-field1, gt_itab-field2, gt_itab-field3. "HEADER LINE 을 통해 출력



*** [부록 : 만약 HEADER LINE 대신 WA를 쓴다면?]
DATA gt_itab2 TYPE t_tab.
DATA gs_wa LIKE LINE OF gt_itab2. "gt_itab 테이블의 행 타입을 따옴
gs_wa-field1 = 'Enjoy'.
gs_wa-field2 = 'ABAP'.
gs_wa-field3 = 1.
APPEND gs_wa TO gt_itab2.

READ TABLE gt_itab2 INDEX 1 INTO gs_wa.

LOOP AT gt_itab2 INTO gs_wa.
  WRITE : / gs_wa-field1, gs_wa-field2, gs_wa-field3.
ENDLOOP.

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
