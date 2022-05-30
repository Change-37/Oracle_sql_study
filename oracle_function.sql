SELECT abs(-15) FROM dual; --절댓값

SELECT ceil(15.7) FROM dual; --올림

SELECT cos(3.14159) FROM dual; --모르겟음

SELECT floor(15.7) FROM dual; --내림

SELECT log(10, 100) FROM dual; --로그

SELECT mod(11, 4) FROM dual; --나머지

SELECT power(3, 2) FROM dual; --제곱

SELECT round(15.7) FROM dual; --반올림

SELECT sign(0) FROM dual; --부호

SELECT trunc(1543.15724659723) FROM dual; --정수형?

SELECT chr(65) FROM dual; --숫자를 문자로 변환

SELECT concat('happy ', 'birthday') FROM dual; --앞뒤로 빈칸없이 붙여서 출력

SELECT lower('Birthday') FROM dual; --소문자로 출력

SELECT lpad('Page 1', 15, '*') FROM dual; --15글자가 될때까지 앞에 * 붙이기

SELECT ltrim('Page 1', 'ae') FROM dual; --이게머임?

SELECT replace('JACK', 'J', 'BL') FROM dual; --JACK의 J를 BL로 바꿔서 출력

SELECT rpad('Page 1', 15, '*') FROM dual; --15글자가 될때까지 뒤에 * 붙이기

SELECT rtrim('Page 1', 'ae') FROM dual; --이게머임?

SELECT substr('ABCDEFG', 3, 4) FROM dual; --3번째 부터 4개 출력

SELECT trim(LEADING 0 FROM '00000AA00') FROM dual; --앞에 존재하는 모든 0을 자름

SELECT upper('Birthday') FROM dual; --대문자로 출력

SELECT ascii('A') FROM dual; --문자를 ascii코드로 변환

SELECT instr('CORPORATE FLOOR', 'OR', 3, 2) FROM dual; --세번째 OR이 어디에 나오는지

SELECT length('Birthday') FROM dual; --문자열의 길이

SELECT add_months('14/05/21', 1) FROM dual; --말그대로

SELECT last_day(sysdate) FROM dual; --이번달 마지막 일

SELECT next_day(sysdate, '일') FROM dual; --다음 일요일이 언제인지

SELECT sysdate FROM dual; --오늘

SELECT to_char(sysdate) FROM dual; --오늘날짜를 문자열으로

SELECT to_char(123) FROM dual; --문자열으로

SELECT to_date('12 05 2020', 'DD MM YYYY') FROM dual; --일/월/년

SELECT to_number('12.3') FROM dual; --number형으로

SELECT decode (1, 1, 'aa', 'bb') FROM dual; --몰루갯음

SELECT nullif(NULL, 345) FROM dual; --앞의 것이 나옴

SELECT nvl(134, 123) FROM dual; --앞의 것이 나옴, 앞의 것이 null이면 그 다음 것 나옴
