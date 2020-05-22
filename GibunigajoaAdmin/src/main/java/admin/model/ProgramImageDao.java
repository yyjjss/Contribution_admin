package admin.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class ProgramImageDao extends SqlSessionDaoSupport{

	public List<ProgramImageDto> getProgramBanner(Map<String, Object> map) {
		return getSqlSession().selectList("admin.selectProgramImages", map);
	}
}
