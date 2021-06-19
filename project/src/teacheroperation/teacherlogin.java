package teacheroperation;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import project.ConnectionProvider;
import studentoperation.studentbilgisi;

public class teacherlogin {

private String teacher_mail, teacher_password;
	
	public boolean teacherlog(teacherbilgisi cbilgi)
	{
	 try
	{
		teacher_mail= cbilgi.getteacher_mail();
		teacher_password=cbilgi.getteacher_password();
		
		Connection con= ConnectionProvider.getCon();
		Statement st= con.createStatement();
		ResultSet rs= st.executeQuery("select * from teacher where teacher_mail='"+teacher_mail+"' and teacher_password='"+teacher_password+"'");
		while (rs.next()){
			return true;	
		}		
	}
	catch(Exception e)
	{
		System.out.println(e);
		return false;
	
}
	return false;
}

}
