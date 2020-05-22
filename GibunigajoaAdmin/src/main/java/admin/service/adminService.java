package admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.model.OrganizationDto;
import admin.model.ProgramDao;
import admin.model.ProgramDto;
import admin.model.ProgramImageDao;
import admin.model.ProgramImageDto;
import admin.model.TypeDao;
import admin.model.UserDto;
import admin.model.adminDao;
import admin.model.adminNoticeDto;
import admin.model.adminQandADto;


@Service
public class adminService {

	@Autowired
	adminDao dao;
	@Autowired
	ProgramDao programDao;
	@Autowired
	TypeDao typeDao;
	@Autowired 
	ProgramImageDao programImageDao;

	public void setTypeDao(TypeDao typeDao) {
		this.typeDao = typeDao;
	}
			
	public void setProgramImageDao(ProgramImageDao programImageDao) {
		this.programImageDao = programImageDao;
	}
	
	public void setDao(adminDao dao) {
		this.dao = dao;
	}
	
	public void setProgramDao(ProgramDao programDao) {
		this.programDao = programDao;
	}
	
	
	
	//Q&A 리스트
	public List<adminQandADto> QandAList(){
		return dao.adminQandA();
	}
	
	//Q&A 상세글 보기
	public adminQandADto QandAContent(int board_idx){
		return dao.adminQandAContent(board_idx);
	}
	
	//Q&A 답변
	public int updateQandA(adminQandADto dto) {
		return dao.updateQandA(dto);
	}
		
	//공지사항 리스트
	public List<adminNoticeDto> adminNotice(){
		return dao.adminNotice();
	}
	
	//공지사항 추가
	public int insertNotice(adminNoticeDto dto) {
		return dao.insertNotice(dto);
	}
	
	//공지사항 삭제
	public int deleteNotice(int notice_idx) {
		return dao.deleteNotice(notice_idx);
	}
	
	//공지사항 상세글
	public adminNoticeDto noticeContent(int notice_idx) {
		return dao.adminNoticeContent(notice_idx);
	}
	
	//공지사항 수정
	public int updateNotice(adminNoticeDto notice_idx) {
		return dao.adminNoticeUpdate(notice_idx);
	}
	
	//프로그램승인 리스트 
	public List<ProgramDto> selectAllProgramList() {
		return programDao.selectAllProgramList();
	}
	
	public Map<String, Object> makeMap(int program_id, String organization_id){
		Map<String, Object> programSearchKeyword = new HashMap<String, Object>();
		programSearchKeyword.put("organization_id", organization_id);
		programSearchKeyword.put("program_id", program_id);
		return programSearchKeyword;
	}
	
	public ProgramDto requestProgramDetail(Map<String, Object> map) {
		return programDao.requestProgramDetail(map);
	}
	
	//프로그램상세에서 호출
	public ProgramDto getProgramInfo(int program_id, String organization_id) {
		ProgramDto pro = requestProgramDetail(makeMap(program_id, organization_id));
		return pro;
	}
		
	public String selectTypeValue(int type_id) {
		return typeDao.selectTypeValue(type_id);
	}

	//프로그램 배너만 뽑을 때 호출.
	public List<ProgramImageDto> getProgramBanner(int program_id, String organization_id) {
		return getProgramBanner(makeMap(program_id, organization_id));
	}
	public List<ProgramImageDto> getProgramBanner(Map<String, Object> map) {
		return programImageDao.getProgramBanner(map);
	}
	
	//프로그램 승인상태 변경
	public int updateApprovalFlg(String organization_id, int program_id, int approval_flg) {
		return programDao.updateApprovalFlg(organization_id, program_id, approval_flg);
	}
	
	//개인회원 리스트
	public List<UserDto> userList(){
		return dao.userList();
	}
	
	//단체회원 리스트
	public List<OrganizationDto> organizationList(){
		return dao.organizationList();
	}
	
	//로그인 체크 
	public UserDto loginCheck(HashMap<String, String> m) {
		return dao.loginCheck(m);
	}
	
}
