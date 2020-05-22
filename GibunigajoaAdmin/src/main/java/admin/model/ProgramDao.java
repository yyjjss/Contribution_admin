package admin.model;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import admin.model.ProgramDto;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ProgramDao extends SqlSessionDaoSupport{

	
	public List<ProgramDto> selectAllProgramList() {
		return getSqlSession().selectList("admin.selectAllRequestProgramList");
	}
	
	public ProgramDto requestProgramDetail(Map<String, Object> map) {
		return getSqlSession().selectOne("admin.selectProgram", map);
	}
	
	//프로그램 승인상태 변경
	public int updateApprovalFlg(String organization_id, int program_id, int approval_flg) {
		Map<String, Object> approvalInfo = new HashMap<String, Object>();
		approvalInfo.put("program_id", program_id);
		approvalInfo.put("organization_id", organization_id);
		approvalInfo.put("approval_flg", approval_flg);
		approvalInfo.put("approval_date", new Date(System.currentTimeMillis()));
		return getSqlSession().update("admin.updateApprovalFlg", approvalInfo);
	}
}
