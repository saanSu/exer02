package beans;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;

public class LoginLogDao extends JdbcDao {
	public int addLog(String id) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "insert into loginlog values(?, ?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setDate(2, new Date(System.currentTimeMillis()));
			int n = ps.executeUpdate(); // send �� receive �۾��� ��.
			conn.close();
			return n;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public Map getLatesetLogById(String id) {
		try {
			Connection conn = DriverManager.getConnection(dburl, dbuser, dbpassword);
			String sql = "select * from loginlog where actor=? order by time desc";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			Map<String, Object> ret;
			if (rs.next()) {
				ret = new LinkedHashMap<>();
				ret.put("actor", rs.getString("actor"));
				ret.put("time", rs.getDate("time"));
			} else {
				ret = null;
			}
			conn.close();
			return ret;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
