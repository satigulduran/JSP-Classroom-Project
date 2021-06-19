package classoperation;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import project.ConnectionProvider;
import studentoperation.studentbilgisi;
import classoperation.classbilgisi;
import java.util.*;
import java.util.Date;
import java.util.Locale;
import java.text.DateFormat;

public class classogConnection {
	private String class_code;
	private int student_id;
	private int class_id;
	private ResultSet resultSet = null;
	Random rand = new Random();
	int ogrsýnýf_id = rand.nextInt(90000) + 10;
	
	
	public boolean classogrConnection(classbilgisi cbilgi,int student_id)
	{
		Connection con = ConnectionProvider.getCon();
		
			class_code=cbilgi.getclass_code();
			System.out.println(class_code);
		
		
		try
		
		{ 
			Statement st;
			Statement st1;
			st = con.createStatement();
			ResultSet rs= st.executeQuery("select class_id from class where class_code='"+class_code+"'");
			while(rs.next()== true) {
	        	System.out.print("sýnýfa katýlmýþsýnýz");
	        	class_id=rs.getInt(1);
	        	   st1 = con.createStatement();
	    		   ResultSet rs1= st1.executeQuery("select * from ogr_sýnýf where ogrenci_id='"+student_id+"'AND class_id='"+class_id+"'");
	    		   while(rs1.next()== true) {
	    	        	System.out.print("sýnýfa katýlmýþsýnýz");
	    	        	return false;
	    	       
	    	        }
	    	        while(rs1.next()== false) {
	    	        	System.out.print("sýnýfa katýlmamýs");
	    	        	PreparedStatement ps = con.prepareStatement("INSERT INTO ogr_sýnýf(ogrsinif_id,ogrenci_id,class_id) values(?,?,?)");
	    				ps.setInt(1, ogrsýnýf_id);
	    				ps.setInt(2,student_id);
	    				ps.setInt(3,class_id);
	    				ps.executeUpdate();
	    				return true;
	    	        }

	        	
	       
	        }
			
		
			return false;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}

}
	public ResultSet selectAllogrencid(int class_id)
	{	
		  resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select ogrenci_id from ogr_sýnýf where class_id='"+class_id+"'");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
}
	

	public ResultSet selectAllComments(int class_id, int postid)
	{	
		resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select * from commentpost where comment_postid='"+postid+"'AND comment_classid='"+class_id+"'");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
}}