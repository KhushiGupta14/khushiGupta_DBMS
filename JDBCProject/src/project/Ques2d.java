package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Ques2d {
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

		String query1 = "update employee set Name=\"Karthik\", Phone_Number=\"1234567890\" where Id=5";
		
		try {
			st.executeUpdate(query1);
			
			System.out.println("Updation Successful");
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			
		}finally {
			st.close();
			con.close();
		}
	}
}
