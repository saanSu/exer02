package beans;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class GoodLogDao extends MybatisDao {

	public GoodLogDao() throws IOException {
		super();
	}
	
	public int addLog(Map map) {
		SqlSession sql = factory.openSession();
		try {
			int r = sql.insert("goodlog.addDataUsingMap", map);
			if (r == 1)
				sql.commit();
			return r;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public List<Integer> getLogByActor(String id) {
		SqlSession sql =factory.openSession();	// JDBC 의 Connect과정
		try {
			List<Integer> p = sql.selectList("goodlog.getSomeDataByActor");
			return p;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
