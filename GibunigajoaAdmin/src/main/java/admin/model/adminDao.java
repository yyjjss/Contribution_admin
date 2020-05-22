package admin.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;




public class adminDao extends SqlSessionDaoSupport{
	
	/* Q&A 리스트 */
	public List<adminQandADto> adminQandA(){
		return getSqlSession().selectList("admin.qAndaList");
	}
	
	//Q&A 상세글 보기
	public adminQandADto adminQandAContent(int board_idx){
		return getSqlSession().selectOne("admin.qAndaContent",board_idx);
	}
	
	//Q&A 답변하기
	public int updateQandA(adminQandADto dto) {
		return getSqlSession().update("admin.qAndaUpdate",dto);
	}
	
	/* 공지사항 리스트 */
	public List<adminNoticeDto> adminNotice(){
		return getSqlSession().selectList("admin.notice");
	}
	
	//공지사항 상세글
	public adminNoticeDto adminNoticeContent(int notice_idx) {
		return getSqlSession().selectOne("admin.noticeContent",notice_idx);
	}
	
	//공지사항 추가
	public int insertNotice(adminNoticeDto dto) {
		return getSqlSession().insert("admin.noticeInsert",dto);
	}
	
	//공지사항 삭제
	public int deleteNotice(int notice_idx) {
		return getSqlSession().delete("admin.noticeDelete",notice_idx);
	}
	
	//공지사항 수정
	public int adminNoticeUpdate(adminNoticeDto notice_idx) {
		return getSqlSession().update("admin.noticeUpdate",notice_idx);
	}
	
	//개인 회원 리스트 
	public List<UserDto> userList(){
		return getSqlSession().selectList("admin.userList");
	}
	
	//단체회원 리스트 
	public List<OrganizationDto> organizationList(){
		return getSqlSession().selectList("admin.organizationList");
	}
	
	//login check
	public UserDto loginCheck(HashMap<String, String> m) {
		UserDto command = getSqlSession().selectOne("admin.loginCheck", m);
		return command;
	}
	

}
