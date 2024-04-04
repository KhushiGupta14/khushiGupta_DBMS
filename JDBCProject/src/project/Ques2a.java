package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Ques2a {
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

		String query1 = "insert into employee values(1, \"Jatin Thakur\", \"jatinthakur@xyz.com\", 8529631470)";
		String query2 = "insert into employee values(2, \"Prateek Sen\", \"prateeksen@xyz.com\", 7532146980)";
		String query3 = "insert into employee values(3, \"Jadu Thakur\", \"jadu@xyz.com\", 9658741280)";
		String query4 = "insert into employee values(4, \"Pratha Kumar\", \"pratha@xyz.com\", 6589741235)";
		String query5 = "insert into employee values(5, \"Jay Patel\", \"jay@xyz.com\", 9955887744)";
		
		try {
			st.executeUpdate(query1);
			st.executeUpdate(query2);
			st.executeUpdate(query3);
			st.executeUpdate(query4);
			st.executeUpdate(query5);
			
			
			System.out.println("Insertion Successful");
		}catch (SQLException e) {
			System.out.println(e.getMessage());
			
		}finally {
			st.close();
			con.close();
		}
	}

}
