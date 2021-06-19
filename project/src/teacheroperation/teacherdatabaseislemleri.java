package teacheroperation;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import project.ConnectionProvider;
import studentoperation.studentbilgisi;

public class teacherdatabaseislemleri {
	
	private ResultSet resultSet = null;
	private String teacher_name,teacher_mail,teacher_password,teacher_time;
	private int teacher_id;
	public teacherdatabaseislemleri() {
		// TODO Auto-generated constructor stub
	}
	public boolean insertData(teacherbilgisi sbilgi)
	{
		teacher_id=sbilgi.getteacher_id();
		teacher_name=sbilgi.getteacher_name();
		teacher_password= sbilgi.getteacher_password();
		teacher_mail=sbilgi.getteacher_mail();
		teacher_time=sbilgi.getteacher_time();
		java.util.Date date = new java.util.Date(); 
		teacher_time=date.toString();
		
		try {
				Connection con = ConnectionProvider.getCon();
				Statement st;
			   st = con.createStatement();
			   ResultSet rs= st.executeQuery("select * from teacher where teacher_id='"+teacher_id+"'");
			   while(rs.next()== true) {

		        	System.out.print("datadanvar");
		        	return false;
		       
		        }
		        while(rs.next()== false) {
		        	System.out.print("Datadan yok");
		        	PreparedStatement ps = con.prepareStatement("INSERT INTO teacher(teacher_id,teacher_name,teacher_mail,teacher_password,teacher_time) values(?,?,?,?,?)");
					ps.setInt(1, teacher_id);
					ps.setString(2,teacher_name);
					ps.setString(3,teacher_mail);
					ps.setString(4, teacher_password);
					ps.setString(5, teacher_time);
					ps.executeUpdate();
					
					return true;
		        }
		        return true;
		} 
		catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;
		}
		
		
	}
	public ResultSet selectAllData()
	{	
		resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select * from teacher order by teacher_time desc");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
		
	}
	public ResultSet findteachername(String teacher_mail)
	{	
		resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select teacher_name from teacher where teacher_mail='"+teacher_mail+"'");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
	}
	public ResultSet selectAllData(int teacher_id)
	{	
		resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select * from teacher where teacher_id='"+teacher_id+"'");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
		
	}
	public boolean updateData(teacherbilgisi sbilgi,int id)
	{
		teacher_id=sbilgi.getteacher_id();
		teacher_name=sbilgi.getteacher_name();
		teacher_password= sbilgi.getteacher_password();
		teacher_mail=sbilgi.getteacher_mail();
		teacher_time=sbilgi.getteacher_time();
		java.util.Date date = new java.util.Date(); 
		teacher_time=date.toString();
		
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			st.executeUpdate("UPDATE teacher SET teacher_name='"+teacher_name+"',teacher_mail='"+teacher_mail+"',teacher_password='"+teacher_password+"',teacher_time='"+teacher_time+"' WHERE teacher_id='"+id+"'");



			return true;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
		
		


}
	public boolean deleteData(int id)
	{
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			st.executeUpdate("DELETE FROM teacher WHERE teacher_id="+id+"");

			
			return true;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
		
	}
	
	public ResultSet findteacherid(String teacher_id)
	{ resultSet=null;
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			 ResultSet resultSet= st.executeQuery("select teacher_name from teacher where teacher_id='"+teacher_id+"'");
             return resultSet;
			
			
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); }
		return resultSet;
	}
	
	public ResultSet findclassinfo(String teacher_name)
	{ resultSet=null;
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			 ResultSet resultSet= st.executeQuery("select * from class where class_teacher='"+teacher_name+"'");
             return resultSet;
			
			
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); }
		return resultSet;
	}	
	public ResultSet findteacherinfo(String teacher_mail)
	{	
		resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select * from teacher where teacher_mail='"+teacher_mail+"'");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
	}
	
	
	public boolean updateteacherpassword(String mail,String password)
	{
		teacher_mail=mail;
		teacher_password=password;
		
		
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			st.executeUpdate("UPDATE teacher SET teacher_password='"+teacher_password+"' WHERE teacher_mail='"+teacher_mail+"'");



			return true;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
		
		


}
	public ResultSet findteachername()
	{	
		resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select teacher_name from teacher ");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
	}
	
	
}
