package admin.model;


import org.mybatis.spring.support.SqlSessionDaoSupport;

public class TypeDao extends SqlSessionDaoSupport{

	public String selectTypeValue(int type_id) {
		return getSqlSession().selectOne("admin.selectType", type_id);
	}
}
