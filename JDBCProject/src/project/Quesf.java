package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class Quesf {
	
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

				String query = "Truncate table employee";

				st.execute(query);
				
				System.out.println("All Record Deleted Successfully.");

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


