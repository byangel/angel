--IDE
 INSERT into COMT_IDS(TABLE_NAME,NEXT_ID) values ('BBS_ID',1);
 INSERT into COMT_IDS(TABLE_NAME,NEXT_ID) values ('BBS_NTT_ID',10001);
 INSERT into COMT_IDS(TABLE_NAME,NEXT_ID) values ('BBS_ANSWER_ID',10001);
 INSERT into COMT_IDS(TABLE_NAME,NEXT_ID) values ('FILE_ID',10001);
 INSERT into COMT_IDS(TABLE_NAME,NEXT_ID) values ('ATCH_FILE_ID',101);
 INSERT into COMT_IDS(TABLE_NAME,NEXT_ID) values ('GROUP_ID',10001);
 INSERT into COMT_IDS(TABLE_NAME,NEXT_ID) values ('LOGINLOG_ID',10001);
 INSERT into COMT_IDS(TABLE_NAME,NEXT_ID) values ('ROLE_ID',10001);
 INSERT into COMT_IDS(TABLE_NAME,NEXT_ID) values ('SYSLOG_ID',10001);

--클래스코드
INSERT INTO COMT_CL_CD(cl_cd, cl_cd_nm, cl_cd_dc, regist_dt, register_id, updt_dt, updusr_id) VALUES ('ANG', 'ANGEL 프레임워크 공통서비스', 'ANGEL 공통서비스', now(), 'system', now(), 'system');
--공통코드
INSERT INTO COMT_CMMN_CD (cl_cd, cd_id, cd_id_nm, cd_id_dc, regist_dt, register_id, updt_dt, updusr_id) VALUES ('ANG', 'ANG001', '권한', '권한 구분', now(), 'system', now(), 'system');
INSERT INTO COMT_CMMN_CD (cl_cd, cd_id, cd_id_nm, cd_id_dc, regist_dt, register_id, updt_dt, updusr_id) VALUES ('ANG', 'ANG002', '게시판', '게시판 구분', now(), 'system', now(), 'system');
INSERT INTO COMT_CMMN_CD (cl_cd, cd_id, cd_id_nm, cd_id_dc, regist_dt, register_id, updt_dt, updusr_id) VALUES ('ANG', 'ANG003', '레이아웃', '레이아웃 구분', now(), 'system', now(), 'system');
INSERT INTO COMT_CMMN_CD (cl_cd, cd_id, cd_id_nm, cd_id_dc, regist_dt, register_id, updt_dt, updusr_id) VALUES ('ANG', 'ANG004', '사용여부', '사용여부', now(), 'system', now(), 'system');
--디테일코드
INSERT INTO COMT_DETAIL_CD ( detail_cd_id, cd_id, detail_cd, upper_cd, detail_cd_nm, detail_cd_eng_nm, detail_cd_dc,detail_cd_ordr, use_at, regist_dt, register_id, updt_dt, updusr_id) VALUES ('1', 'ANG001', 'ROLE_SYSTEM', '', '시스템', 'SYSTEM', '시스템관리자 권한', '0','Y', now(), 'system', now(), 'system');
INSERT INTO COMT_DETAIL_CD ( detail_cd_id, cd_id, detail_cd, upper_cd, detail_cd_nm, detail_cd_eng_nm, detail_cd_dc,detail_cd_ordr, use_at, regist_dt, register_id, updt_dt, updusr_id) VALUES ('2', 'ANG001', 'ROLE_ADMIN', '', '관리자', 'ADMIN', '관리자 권한', '1','Y', now(), 'system', now(), 'system');
INSERT INTO COMT_DETAIL_CD ( detail_cd_id, cd_id, detail_cd, upper_cd, detail_cd_nm, detail_cd_eng_nm, detail_cd_dc,detail_cd_ordr, use_at, regist_dt, register_id, updt_dt, updusr_id) VALUES ('3', 'ANG001', 'ROLE_USER', '', '일반사용자', 'USER', '일반사용자 권한', '2','Y', now(), 'system', now(), 'system');
INSERT INTO COMT_DETAIL_CD ( detail_cd_id, cd_id, detail_cd, upper_cd, detail_cd_nm, detail_cd_eng_nm, detail_cd_dc,detail_cd_ordr, use_at, regist_dt, register_id, updt_dt, updusr_id) VALUES ('4', 'ANG001', 'ROLE_ANONYMOUS', '', 'ANONYMOUS', 'ANONYMOUS', '미확인사용자', '3','Y', now(), 'system', now(), 'system');
INSERT INTO COMT_DETAIL_CD ( detail_cd_id, cd_id, detail_cd, upper_cd, detail_cd_nm, detail_cd_eng_nm, detail_cd_dc,detail_cd_ordr, use_at, regist_dt, register_id, updt_dt, updusr_id) VALUES ('5', 'ANG002', 'BT_BOARD', '', '일반게시판', 'BOARD', '일반게시판', '0','Y', now(), 'system', now(), 'system');
INSERT INTO COMT_DETAIL_CD ( detail_cd_id, cd_id, detail_cd, upper_cd, detail_cd_nm, detail_cd_eng_nm, detail_cd_dc,detail_cd_ordr, use_at, regist_dt, register_id, updt_dt, updusr_id) VALUES ('6', 'ANG002', 'BT_QNA', '', '질문과답변', 'QNA', '질문게시판', '1','Y', now(), 'system', now(), 'system');
INSERT INTO COMT_DETAIL_CD ( detail_cd_id, cd_id, detail_cd, upper_cd, detail_cd_nm, detail_cd_eng_nm, detail_cd_dc,detail_cd_ordr, use_at, regist_dt, register_id, updt_dt, updusr_id) VALUES ('7', 'ANG002', 'BT_FAQ', '', '자주묻는질문', 'FAQ', '자주묻는질문 게사판', '2','Y', now(), 'system', now(), 'system');
INSERT INTO COMT_DETAIL_CD ( detail_cd_id, cd_id, detail_cd, upper_cd, detail_cd_nm, detail_cd_eng_nm, detail_cd_dc,detail_cd_ordr, use_at, regist_dt, register_id, updt_dt, updusr_id) VALUES ('8', 'ANG002', 'BT_PHOTO', '', '겔러리', 'PHOTO', '겔러리 게시판', '3','Y', now(), 'system', now(), 'system');
INSERT INTO COMT_DETAIL_CD ( detail_cd_id, cd_id, detail_cd, upper_cd, detail_cd_nm, detail_cd_eng_nm, detail_cd_dc,detail_cd_ordr, use_at, regist_dt, register_id, updt_dt, updusr_id) VALUES ('9', 'ANG003', 'LAYOUT_REST', '', '관리자화면', 'LAYOUT_REST', '관리자화면', '0','Y', now(), 'system', now(), 'system');
INSERT INTO COMT_DETAIL_CD ( detail_cd_id, cd_id, detail_cd, upper_cd, detail_cd_nm, detail_cd_eng_nm, detail_cd_dc,detail_cd_ordr, use_at, regist_dt, register_id, updt_dt, updusr_id) VALUES ('10', 'ANG003', 'LAYOUT_FRONT', '', '사용자화면', 'LAYOUT_FRONT', '사용자화면', '1','Y', now(), 'system', now(), 'system');
INSERT INTO COMT_DETAIL_CD ( detail_cd_id, cd_id, detail_cd, upper_cd, detail_cd_nm, detail_cd_eng_nm, detail_cd_dc,detail_cd_ordr, use_at, regist_dt, register_id, updt_dt, updusr_id) VALUES ('11', 'ANG003', 'LAYOUT_SYSTEM', '', '시스템관리화면', 'LAYOUT_SYSTEM', '시스템관리화면', '2','Y', now(), 'system', now(), 'system');
INSERT INTO COMT_DETAIL_CD ( detail_cd_id, cd_id, detail_cd, upper_cd, detail_cd_nm, detail_cd_eng_nm, detail_cd_dc,detail_cd_ordr, use_at, regist_dt, register_id, updt_dt, updusr_id) VALUES ('12', 'ANG004', 'Y', '', '예', 'YES', '예', '0','Y', now(), 'system', now(), 'system');
INSERT INTO COMT_DETAIL_CD ( detail_cd_id, cd_id, detail_cd, upper_cd, detail_cd_nm, detail_cd_eng_nm, detail_cd_dc,detail_cd_ordr, use_at, regist_dt, register_id, updt_dt, updusr_id) VALUES ('13', 'ANG004', 'N', '', '아니오', 'NO', '아니오', '1','Y', now(), 'system', now(), 'system');

