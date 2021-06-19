package studentoperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.*;
import studentoperation.studentbilgisi;
import project.ConnectionProvider;
public class studentlogin {

private String student_mail, student_password;
	
	public boolean studentlog(studentbilgisi cbilgi)
	{
	 try
	{
		student_mail= cbilgi.getstudent_mail();
		student_password=cbilgi.getstudent_password();
		
		Connection con= ConnectionProvider.getCon();
		Statement st= con.createStatement();
		ResultSet rs= st.executeQuery("select * from student where student_mail='"+student_mail+"' and student_password='"+student_password+"'");
		while (rs.next()){
			return true;	
		}		
	}
	catch(Exception e)
	{
		System.out.println(e);
		
	
}
	return false;
}

}
