SELECT abs(-15) FROM dual; --����

SELECT ceil(15.7) FROM dual; --�ø�

SELECT cos(3.14159) FROM dual; --�𸣰���

SELECT floor(15.7) FROM dual; --����

SELECT log(10, 100) FROM dual; --�α�

SELECT mod(11, 4) FROM dual; --������

SELECT power(3, 2) FROM dual; --����

SELECT round(15.7) FROM dual; --�ݿø�

SELECT sign(0) FROM dual; --��ȣ

SELECT trunc(1543.15724659723) FROM dual; --������?

SELECT chr(65) FROM dual; --���ڸ� ���ڷ� ��ȯ

SELECT concat('happy ', 'birthday') FROM dual; --�յڷ� ��ĭ���� �ٿ��� ���

SELECT lower('Birthday') FROM dual; --�ҹ��ڷ� ���

SELECT lpad('Page 1', 15, '*') FROM dual; --15���ڰ� �ɶ����� �տ� * ���̱�

SELECT ltrim('Page 1', 'ae') FROM dual; --�̰Ը���?

SELECT replace('JACK', 'J', 'BL') FROM dual; --JACK�� J�� BL�� �ٲ㼭 ���

SELECT rpad('Page 1', 15, '*') FROM dual; --15���ڰ� �ɶ����� �ڿ� * ���̱�

SELECT rtrim('Page 1', 'ae') FROM dual; --�̰Ը���?

SELECT substr('ABCDEFG', 3, 4) FROM dual; --3��° ���� 4�� ���

SELECT trim(LEADING 0 FROM '00000AA00') FROM dual; --�տ� �����ϴ� ��� 0�� �ڸ�

SELECT upper('Birthday') FROM dual; --�빮�ڷ� ���

SELECT ascii('A') FROM dual; --���ڸ� ascii�ڵ�� ��ȯ

SELECT instr('CORPORATE FLOOR', 'OR', 3, 2) FROM dual; --����° OR�� ��� ��������

SELECT length('Birthday') FROM dual; --���ڿ��� ����

SELECT add_months('14/05/21', 1) FROM dual; --���״��

SELECT last_day(sysdate) FROM dual; --�̹��� ������ ��

SELECT next_day(sysdate, '��') FROM dual; --���� �Ͽ����� ��������

SELECT sysdate FROM dual; --����

SELECT to_char(sysdate) FROM dual; --���ó�¥�� ���ڿ�����

SELECT to_char(123) FROM dual; --���ڿ�����

SELECT to_date('12 05 2020', 'DD MM YYYY') FROM dual; --��/��/��

SELECT to_number('12.3') FROM dual; --number������

SELECT decode (1, 1, 'aa', 'bb') FROM dual; --���簹��

SELECT nullif(NULL, 345) FROM dual; --���� ���� ����

SELECT nvl(134, 123) FROM dual; --���� ���� ����, ���� ���� null�̸� �� ���� �� ����
