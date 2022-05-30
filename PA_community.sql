CREATE TABLE MyUser (
    user_seq number,
    id varchar2(20),
    user_name varchar2(20),
    datetime date,
    PRIMARY KEY(user_seq)
);
DROP TABLE MyUser;

CREATE TABLE MyCategory (
    category_seq number,
    name varchar2(20),
    PRIMARY KEY (category_seq)
);
DROP TABLE MyCategory;

CREATE TABLE Post (
    post_seq number,
    category_seq number,
    user_seq number,
    title varchar2(40),
    content varchar2(4000),
    datetime date,
    PRIMARY KEY (post_seq),
    FOREIGN KEY (category_seq) REFERENCES MyCategory(category_seq)  ON DELETE CASCADE,
    FOREIGN KEY (user_seq) REFERENCES MyUser(user_seq)  ON DELETE CASCADE
);
DROP TABLE post;

CREATE TABLE MyComment (
    comment_seq number,
    post_seq number,
    user_seq number,
    content varchar2(4000),
    datetime date,
    parent number,
    PRIMARY KEY (comment_seq),
    FOREIGN KEY (post_seq) REFERENCES post(post_seq)  ON DELETE CASCADE,
    FOREIGN KEY (user_seq) REFERENCES MyUser(user_seq)  ON DELETE CASCADE,
    FOREIGN KEY (parent) REFERENCES MyComment(comment_seq)  ON DELETE CASCADE
);
DROP TABLE MyComment;


INSERT INTO Myuser VALUES (1, 'lee1545', '�̼���', TO_DATE('2022-05-04', 'yyyy-mm-dd'));
INSERT INTO MyUser VALUES (2, 'lee1502', '��Ȳ', TO_DATE('2022-05-01', 'yyyy-mm-dd'));
INSERT INTO MyUser VALUES (3, 'lee1536', '����', TO_DATE('2022-05-02', 'yyyy-mm-dd'));
INSERT INTO MyUser VALUES (4, 'lee1397', '�������', TO_DATE('2022-05-03', 'yyyy-mm-dd'));
INSERT INTO MyUser VALUES (5, 'shin1504', '�Ż��Ӵ�', TO_DATE('2022-05-05', 'yyyy-mm-dd'));

INSERT INTO MyCategory VALUES (1, '����');
INSERT INTO MyCategory VALUES (2, '����');
INSERT INTO MyCategory VALUES (3, '��ȭ����');

INSERT INTO Post VALUES (1, 1, 1, '������ ����', '�⺻�� ���翡�� ������������ ������ ��ġ�� ���(�ɼ� Ŭ�ο�)�� �������� ����ġ�� ��ġ�� 2���� �Ͽ� ��ȸ�� ������ ������ �����ϴ� ����̴�. �ѴϹ� �ٸ�ī�� ĭ���� �������� ����� �⵿ �⸶�� 2�δ븦 �̿��ϰ� �ڽ��� �������� ������� ���� ����Ͽ� �¸��� �ŵ״� �����̴�. �����ε��� �̸� ���� ���������� �θ����� ���� ������ �⺻�� ���񱺴� 2���� �߰��� ����Ͽ� �������� �ϼ���Ų ���´�. ��, �̰��� �������� ����� �⸶���� �⵿���� �̿��� ������ �����̶� ���̴�.', TO_DATE('1592-08-14', 'yyyy-mm-dd'));
INSERT INTO Post VALUES (2, 3, 4, '�ƹ�����', '�ƹ�����(��������)�� �鼺�� ����ġ�� �ٸ� �Ҹ���� ���̴�. �ƹ������̶�� �θ��� ����� �� ������ �ִµ�, �� �ϳ��� 1443�� ���� 12��(��� 1444�� 1��)�� ��������� ���� �ѱ����� ǥ�� ü��, �� ���ó��� �ѱ��� â�� ��ÿ� �θ� �̸��̰�, �� �ϳ��� 1446�� 9��[1]�� �߰��� å �̸��̴�. ���⼭�� ����, �� �ƹ������̶�� å�� �����Ѵ�.', TO_DATE('1446-10-09', 'yyyy-mm-dd'));
INSERT INTO Post VALUES (3, 1, 5, '�Ż��Ӵ翡 ����', '�Ż��Ӵ� [��������, 1504~1551] ������ ���(��ߣ)�̰�, ȣ�� ���Ӵ�(������:������:������)�����Ӵ�(�����)���ӻ���(�����)�̴�. ������ ����(˰��) ����̸�, ���� ����(���)�� ��Ӵ��̴�. ȿ���� �����ϰ� ������ �������� ��������� �湮(����)�� ������ ���塤ħ��(����)���ڼ�(��)�� ��������, Ư�� �ù�(����)�� �׸��� �پ ���� ���� �ѽ�(����) ��ǰ�� ��������. ���� �Ȱ�(��̱)�� ������ ���� ȭǳ(����)�� ���� Ư���� ���� �������� ���Ͽ� �ѱ� ������ ����ȭ����� ���� ��´�. ���(ߣ�)��������Ǯ������ ���� �� �׷ȴ�. �ڳ౳������ ���ٸ� ����� ��￩ �����ó(��ٽ����)�� �Ͱ�(Т��)�� �Ǿ���. ������ ��Ӵ��̴�.', TO_DATE('1504-10-29', 'yyyy-mm-dd'));
INSERT INTO Post VALUES (4, 2, 3, '�ʸ��纴��', '���̴� �������� 10�� �纴���� �����Ͽ� ������ �ݰ��� ��⵵ �Ͽ���.[19] �״� �Ϻ��� �����ô�� ����� ���̸�, �Ϻ��� ������ ����� �Ϻ� �� ���� �� ���� ��ȭ�� ���� ���ɻ縦 �ٸ� ������ ������ ���� �������� �̱��� ���� ������ ħ���� ���̶�� �����ߴ�. �Ϻ��� ���߿� ���� �������� �״� 10�� ���� ������ �缺�Ͽ� �Ϻ��� ħ���� ����� ���� �����Ͽ���. �׷��� ���� �̷��� ���ش� ���ο� ���� ���� ��Ȥ�ϱ� ���� �߾����� ġ�εǾ���, �������� ���� ������ ����ģ ���°� ����̶�� ȣ�������� �ʾҴ�. ���̰� 10�� �纴���� �����ϴ� ���, ������ �� ���¼��� ��λ����δ� 30�� ���� �Ѿ�����, ���� ���� ������ ���� ���ڴ� 1,000�� ������ �Ǿ��ٰ� �Ѵ�.[20] 1581�� ������ ���� �� �������� �����ϴ� ���濬�ϱ⡷�� �ϼ��� ���Ҵ�.', TO_DATE('1583-01-01', 'yyyy-mm-dd'));

INSERT INTO MyComment VALUES (1, 1, 2, '�ѻ굵 ��ø(��ߣ������) Ȥ�� �߳�����ø(̸Ҭ������)�� 1592�� 8�� 14��(���� 25�� ���� 7�� 8��) �뿵 �ѻ굵 �չٴٿ��� ���� ������ �ֱ��� ũ�� ��� ����', TO_DATE('2022-05-01', 'yyyy-mm-dd'), null);
INSERT INTO MyComment VALUES (2, 1, 3, '�� �������� �������� ����ϴ� ���� ���� ���� ������ �������� ó������ �������� ���ƴ�.', TO_DATE('2022-05-01', 'yyyy-mm-dd'), 1);
INSERT INTO MyComment VALUES (3, 3, 2, '������ ��Ӵ� �Ż��Ӵ�', TO_DATE('2022-05-01', 'yyyy-mm-dd'), null);
INSERT INTO MyComment VALUES (4, 2, 1, '�����ٶ󸶹ٻ�', TO_DATE('2022-05-01', 'yyyy-mm-dd'), null);

SELECT user_name
FROM MyUser
;

SELECT comment_seq, content, parent
FROM mycomment
WHERE parent IS NOT NULL
;

SELECT content, id, user_name
FROM post, myuser
WHERE post.user_seq = myuser.user_seq AND (user_name LIKE '%����%' OR content LIKE '%����%')
;

SELECT 
    mycategory.name AS ī�װ�, 
    post.post_seq AS �۹�ȣ, 
    title AS ����, 
    myuser.user_name AS �۾���, 
    TO_CHAR(post.datetime, 'yyyy-mm-dd') AS �ۼ��ð�, 
    (SELECT COUNT(comment_seq)
     FROM mycomment
     WHERE mycomment.post_seq = post.post_seq) AS ��ۼ�
FROM myuser, post, mycategory
WHERE post.category_seq = mycategory.category_seq 
    AND myuser.user_seq = post.user_seq
ORDER BY �ۼ��ð� DESC
;

UPDATE post
SET category_seq = 1
WHERE post_seq = 2
;