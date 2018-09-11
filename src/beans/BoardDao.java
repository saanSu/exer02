package beans;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class BoardDao extends MybatisDao {

	
	public BoardDao() throws IOException {
		super();
	}
	
	public int increaseGoodByNo(int no) {
		SqlSession sql = factory.openSession();
		try {
			int r = sql.insert("board.incGoodByNo", no);
			if (r == 1)
				sql.commit();
			return r;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
	public int addData(Map map) {
		SqlSession sql = factory.openSession();
		try {
			int r = sql.insert("board.addDataUsingMap", map);
			if (r == 1)
				sql.commit();
			return r;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public List<Map> getAllDatas() {
		SqlSession sql =factory.openSession();	// JDBC 의 Connect과정
		try {
			List<Map> p = sql.selectList("board.getAllDataUsingMap");
			return p;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	public Map getOneByNo(int no) {
		SqlSession session = factory.openSession();
		try {
			/*
			 * List<Map> some = session.selectList("board.getOneDataUsingMapByNo", no);
			 * if(some.size()==1) {
			 * 	return some.get(0);
			 * }else {
			 * 	return null;
			 * }
			 */
			return session.selectOne("board.getOneDataUsingMapByNo", no);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
