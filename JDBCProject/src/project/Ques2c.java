package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Ques2c {
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

		String query1 = "insert into employee values(6, \"Khushi Gupta\", \"khushi@xyz.com\", 753698245)";
		String query2 = "insert into employee values(7, \"Aditya Shahi\", \"adityashahi@xyz.com\", 7654786980)";
		
		try {
			st.executeUpdate(query1);
			st.executeUpdate(query2);
						
			System.out.println("Insertion Successful");
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			
		}finally {
			st.close();
			con.close();
		}
	}

}
