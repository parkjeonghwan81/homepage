package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBOpen {
	
	public static Connection getConnection(){
		Connection con = null;
		
		try {
			Class.forName(constant.DRIVER);
			con = DriverManager.getConnection(constant.URL, constant.USER, constant.PASSWORD);
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
}
