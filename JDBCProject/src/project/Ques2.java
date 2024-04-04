package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Ques2 {
	public static void main(String[] args) throws SQLException {

		String driver = "com.mysql.cj.jdbc.Driver";

		try {
			Class.forName(driver);
		}catch (ClassNotFoundException e) {
			System.out.println(e.getMessage());
			return;
		}
		Connection con = null;
		Statement st = null;

		try {
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/gl?useSSL=false", "root","root");
			
			st = con.createStatement();

			String query = "create table employee(Id int primary key, Name varchar(50) NOT NULL, Email_Id varchar(50) NOT NULL, Phone_Number varchar(10))";

			st.execute(query);
			
			System.out.println("Table Created Successfully.");

		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();

		}finally {
			st.close();
			con.close();
		}

	}

}
