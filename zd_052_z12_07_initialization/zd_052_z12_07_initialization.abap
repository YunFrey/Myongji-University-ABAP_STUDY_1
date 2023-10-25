*&---------------------------------------------------------------------*
*& Report ZD_052_Z12_07_INITIALIZATION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ZD_052_Z12_07_INITIALIZATION.

TABLES : sflight.

PARAMETERS : p_carrid LIKE sflight-carrid,
             p_connid LIKE sflight-connid.

SELECT-OPTIONS : s_fldate FOR sflight-fldate.

INITIALIZATION.
* SET TITLEBAR 'T1000'.
* SET PF-STATUS 'TEST'.

p_carrid = 'AA'. "p_carrid 매개변수의 값을 AA로 지정
p_connid = '17'. "p_connid 매개변수의 값을 17로 지정
s_fldate-low = '20150101'. "s_fldate 의 최저값을 20150101로 지정
s_fldate-high = '20151231'. "s_fldate 의 최대값을 20151231로 지정
APPEND s_fldate. "s_fldate 에 속성값 추가

----------------------------------------------------------------------------------
Extracted by Mass Download version 1.5.5 - E.G.Mellodew. 1998-2023. Sap Release 753
