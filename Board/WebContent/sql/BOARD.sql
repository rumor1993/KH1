create table BOARD(
	BOARD_NUM NUMBER, -- �۹�ȣ
	BOARD_NAME VARCHAR2(30), -- �ۼ���
	BOARD_PASS VARCHAR2(30), -- ��й�ȣ
	BOARD_SUBJECT VARCHAR2(300), -- ����
	BOARD_CONTENT VARCHAR2(4000), -- ����
	BOARD_FILE VARCHAR2(50), -- ÷�ε� ���ϸ�
	BOARD_RE_REF NUMBER, -- �亯 �� �ۼ��� �����Ǵ� ���� ��ȣ
	BOARD_RE_LEV NUMBER, -- �亯 ���� ����
	BOARD_RE_SEQ NUMBER, -- �亯 ���� ����
	BOARD_READCOUNT NUMBER, -- ���� ��ȸ��
	BOARD_DATE DATE, -- ���� �ۼ� ����
	PRIMARY KEY(BOARD_NUM)
);

select * from BOARD;

drop table board;