package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Ques2b {
	public static void main(String[] args) throws SQLException {

		String driver = "com.mysql.cj.jdbc.Driver";

		try {
			Class.forName(driver);
		}catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
			return;
		}
		Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/gl?useSSL=false", "root","root");
		
		Statement st = con.createStatement();

		String query1 = "ALTER TABLE employee Modify column Email_Id varchar(30) NOT NULL";
		
		try {
			st.executeUpdate(query1);
			
			
			System.out.println("Modification Successful");
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			
		}finally {
			st.close();
			con.close();
		}
	}

}