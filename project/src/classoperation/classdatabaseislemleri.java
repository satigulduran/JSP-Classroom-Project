package classoperation;
import java.sql.Connection;
import java.util.Date;
import java.util.Locale;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.sql.PreparedStatement;
import project.ConnectionProvider;

public class classdatabaseislemleri {
	private String post_time, comment_content, content_person;
	private ResultSet resultSet = null;
	private String class_name,class_teacher,class_code, post_writer, post_content, comment_time, class_subject;
	private int class_id, post_id, post_classid, comment_id, comment_classid, comment_postid;

	public classdatabaseislemleri() {
		// TODO Auto-generated constructor stub
	}
	public boolean insertData(classbilgisi cbilgi)
	{
		class_id=cbilgi.getclass_id();
		class_name=cbilgi.getclass_name();
		class_teacher= cbilgi.getclass_teacher();
		class_code=cbilgi.getclass_code();
		class_subject= cbilgi.getclass_subject();
		try {
				Connection con = ConnectionProvider.getCon();
				Statement st;
			   st = con.createStatement();
			   ResultSet rs= st.executeQuery("select * from class where class_id='"+class_id+"'");
			   while(rs.next()== true) {

		        	System.out.print("datadanvar");
		        	return false;
		       
		        }
		        while(rs.next()== false) {
		        	System.out.print("Datadan yok");
		        	PreparedStatement ps = con.prepareStatement("INSERT INTO class(class_id,class_name,class_teacher,class_subject,class_code) values(?,?,?,?,?)");
					ps.setInt(1, class_id);
					ps.setString(2,class_name);
					ps.setString(3,class_teacher);
					ps.setString(4, class_subject);
					ps.setString(5, class_code);
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
               ResultSet rs= st.executeQuery("select * from class");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
		
	}
	public ResultSet selectAllData(int class_id)
	{	
		resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select * from class where class_id='"+class_id+"'");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
		
	}
	public ResultSet selectclassData(int post_classid)
	{	
		resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select * from post where post_classid='"+post_classid+"'");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
		
	}
	public boolean updateData(classbilgisi cbilgi,int id)
	{
		class_id= cbilgi.getclass_id();
		class_name=cbilgi.getclass_name();
		class_teacher= cbilgi.getclass_teacher();
		class_code=cbilgi.getclass_code();
		class_subject=cbilgi.getclass_subject();
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			st.executeUpdate("UPDATE class SET class_name='"+class_name+"',class_teacher='"+class_teacher+"',class_subject='"+class_subject+"',class_code='"+class_code+"' WHERE class_id='"+id+"'");



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
			st.executeUpdate("DELETE FROM class WHERE class_id="+id+"");

			
			return true;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
		
	}
	
	public boolean insertpost(classpost classpst)
	{
		post_id=classpst.getpost_id();
		post_content=classpst.getpost_content();
		post_writer=classpst.getpost_writer();
		post_classid=classpst.getpost_classid();
		java.util.Date date = new java.util.Date(); 
		Date dt = new Date();
	    DateFormat dateFormat;
		dateFormat = DateFormat.getDateInstance(DateFormat.SHORT, Locale.FRENCH);
		post_time=dateFormat.format(dt).toString();
		try {
					Connection con = ConnectionProvider.getCon();
					Statement st;
					st = con.createStatement();
		       
		        	PreparedStatement ps = con.prepareStatement("INSERT INTO post(post_id,post_content,post_writer,post_time,post_classid) values(?,?,?,?,?)");
					ps.setInt(1, post_id);
					ps.setString(2,post_content);
					ps.setString(3,post_writer);
					ps.setString(4,  post_time);
					ps.setInt(5, post_classid);
					ps.executeUpdate();
				
		        
		        return true;
		} 
		catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;
		}
		
}
	public boolean ogrsinifdata(int classid, int studentid)
	{
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			System.out.println(class_id);
			System.out.println(studentid);
			st.executeUpdate("DELETE FROM ogr_sýnýf WHERE class_id='"+classid+"'AND ogrenci_id='"+studentid+"'");

			
			return true;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
		
	}
	public boolean deletepost(int post_id)
	{
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			
			st.executeUpdate("DELETE FROM post WHERE post_id='"+post_id+"'");

			
			return true;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
		
	}
	
	public boolean insertcomment(classcomment cbilgi)
	{
		comment_id=cbilgi.getcomment_id();
		comment_content=cbilgi.getcomment_content();
		comment_classid=cbilgi.getcomment_classid();
		comment_postid=cbilgi.getcomment_postid();
		content_person=cbilgi.getcontent_person();
		java.util.Date date = new java.util.Date(); 
		Date dt = new Date();
	    DateFormat dateFormat;
		dateFormat = DateFormat.getDateInstance(DateFormat.SHORT, Locale.FRENCH);
		comment_time=dateFormat.format(dt).toString();
		
		try {
				Connection con = ConnectionProvider.getCon();
				Statement st;
			   st = con.createStatement();
			   ResultSet rs= st.executeQuery("select * from commentpost where comment_id='"+comment_id+"'");
			   while(rs.next()== true) {

		        	System.out.print("datadanvar");
		        	return false;
		       
		        }
		        while(rs.next()== false) {
		        	System.out.print("Datadan yok");
		        	PreparedStatement ps = con.prepareStatement("INSERT INTO commentpost(comment_id,comment_content,comment_classid,comment_postid,comment_time,content_person) values(?,?,?,?,?,?)");
					ps.setInt(1, comment_id);
					ps.setString(2,comment_content);
					ps.setInt(3,comment_classid);
					ps.setInt(4, comment_postid);
					ps.setString(5,comment_time);
					ps.setString(6,content_person);
					ps.executeUpdate();
					
					return true;
		        }
		        return true;
		} 
		catch (Exception e) { 
			System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;
		}
		
		
	}
	
}

