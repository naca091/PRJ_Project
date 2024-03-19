import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class test {
	public static void main(String[] args) throws SQLException {
		Connection connection = null;
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String connectionUrl = "jdbc:sqlserver://LAPTOP-KSCIFN6A\\TUAN:1433;" + "databaseName=managerCar;integratedSecurity=true;" + "encrypt=true;trustServerCertificate=true";
			connection = DriverManager.getConnection(connectionUrl, "sa", "tuanqn2103");
			System.out.println("The Connect is success!!!!"); 
		} catch (ClassNotFoundException e) {
			System.out.println("The Connect is failed");
		}
	}
}
