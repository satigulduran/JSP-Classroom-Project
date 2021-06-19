package studentoperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
import studentoperation.studentbilgisi;
import project.ConnectionProvider;

public class studentdatabaseislemleri {
	
	private ResultSet resultSet = null;
	private String student_name,student_mail,student_password,student_time;
	private int student_id;

	public studentdatabaseislemleri() {
		// TODO Auto-generated constructor stub
	}
	public boolean insertData(studentbilgisi sbilgi)
	{
		student_id=sbilgi.getstudent_id();
		student_name=sbilgi.getstudent_name();
		student_password= sbilgi.getstudent_password();
		student_mail=sbilgi.getstudent_mail();
		student_time=sbilgi.getstudent_time();
		java.util.Date date = new java.util.Date(); 
		student_time=date.toString();
		 
		try {
				Connection con = ConnectionProvider.getCon();
				Statement st;
			   st = con.createStatement();
			   ResultSet rs= st.executeQuery("select * from student where student_id='"+student_id+"'");
			   while(rs.next()== true) {

		        	System.out.print("datadanvar");
		        	return false;
		       
		        }
		        while(rs.next()== false) {
		        	System.out.print("Datadan yok");
		        	PreparedStatement ps = con.prepareStatement("INSERT INTO student(student_id,student_name,student_mail,student_password,student_time) values(?,?,?,?,?)");
					ps.setInt(1, student_id);
					ps.setString(2,student_name);
					ps.setString(3,student_mail);
					ps.setString(4, student_password);
					ps.setString(5, student_time);
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
               ResultSet rs= st.executeQuery("select * from student order by student_time desc");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
		
	}
	public ResultSet selectAllData(int student_id)
	{	
		resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select * from student where student_id='"+student_id+"'");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
		
	}
	public boolean updateData(studentbilgisi sbilgi,int id)
	{
		student_id=sbilgi.getstudent_id();
		student_name=sbilgi.getstudent_name();
		student_password= sbilgi.getstudent_password();
		student_mail=sbilgi.getstudent_mail();
		student_time=sbilgi.getstudent_time();
		java.util.Date date = new java.util.Date(); 
		student_time=date.toString();
		
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			st.executeUpdate("UPDATE student SET student_name='"+student_name+"',student_mail='"+student_mail+"',student_password='"+student_password+"',student_time='"+student_time+"' WHERE student_id='"+id+"'");



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
			st.executeUpdate("DELETE FROM student WHERE student_id="+id+"");

			
			return true;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
		
	}
	
	
	public ResultSet findclass(int student_id)
	{resultSet=null;
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			
			ResultSet rs= st.executeQuery("select class_id from ogr_sýnýf where ogrenci_id='"+student_id+"'");		
			return rs;
           
            
             
			
	}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); }
		return resultSet;
		
	}
	
	public ResultSet findclassinfo(int class_id)
	{resultSet=null;
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			
			ResultSet rs= st.executeQuery("select * from class where class_id='"+class_id+"'");		
			return rs;
           	
	}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); }
		return resultSet;
		
	}
	
	public ResultSet selectAllDatastudent(String student_mail)
	{	
		resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select * from student where student_mail='"+student_mail+"'");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
		
	}
	public ResultSet findstudentid(String student_mail)
	{	
		resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select student_id from student where student_mail='"+student_mail+"'");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
		
	}
	public boolean updatestudentpassword(String mail,String password)
	{
		student_mail=mail;
		student_password=password;
		
		
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			st.executeUpdate("UPDATE student SET student_password='"+student_password+"' WHERE student_mail='"+student_mail+"'");



			return true;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
		
		


}
}
