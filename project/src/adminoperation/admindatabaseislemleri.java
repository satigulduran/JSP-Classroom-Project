package adminoperation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import adminoperation.adminbilgisi;
import project.ConnectionProvider;

public class admindatabaseislemleri {
	private ResultSet resultSet = null;
	private String admin_name,admin_mail,admin_sifre;
	private int admin_id;
	public admindatabaseislemleri() {
		// TODO Auto-generated constructor stub
	}
	public boolean insertData(adminbilgisi cbilgi)
	{
		admin_id=cbilgi.getadmin_id();
		admin_name=cbilgi.getadmin_name();
		admin_mail= cbilgi.getadmin_mail();
		admin_sifre=cbilgi.getadmin_sifre();
		
		try {
				Connection con = ConnectionProvider.getCon();
				Statement st;
			   st = con.createStatement();
			   ResultSet rs= st.executeQuery("select * from admin where admin_id='"+admin_id+"'");
			   while(rs.next()== true) {

		        	System.out.print("datadanvar");
		        	return false;
		       
		        }
		        while(rs.next()== false) {
		        	System.out.print("Datadan yok");
		        	PreparedStatement ps = con.prepareStatement("INSERT INTO admin(admin_id,admin_name,admin_mail,admin_sifre) values(?,?,?,?)");
					ps.setInt(1, admin_id);
					ps.setString(2,admin_name);
					ps.setString(3,admin_mail);
					ps.setString(4, admin_sifre);
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
               ResultSet rs= st.executeQuery("select * from admin order by admin_id desc");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
		
	}
	public ResultSet selectAllData(int admin_id)
	{	
		resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select * from admin where admin_id='"+admin_id+"'");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
		
	}
	public ResultSet selectAllDataadmin(String admin_mail)
	{	
		resultSet=null;
		try
		{
			   Connection con = ConnectionProvider.getCon();
               Statement st = con.createStatement();
               ResultSet rs= st.executeQuery("select * from admin where admin_mail='"+admin_mail+"'");
               return rs;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage());
			
		}
		return resultSet;
		
		
	}
	public boolean updateData(adminbilgisi cbilgi,int id)
	{
		admin_id=cbilgi.getadmin_id();
		admin_name=cbilgi.getadmin_name();
		admin_mail= cbilgi.getadmin_mail();
		admin_sifre=cbilgi.getadmin_sifre();
		
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			st.executeUpdate("UPDATE admin SET admin_name='"+admin_name+"',admin_mail='"+admin_mail+"',admin_sifre='"+admin_sifre+"' WHERE admin_id='"+id+"'");



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
			st.executeUpdate("DELETE FROM admin WHERE admin_id="+id+"");

			
			return true;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); return false;}
		
	}

	
	
	
	
	
	public boolean updateadminpassword(String mail,String password)
	{
		admin_mail=mail;
		admin_sifre=password;
		
		
		try
		{
			Connection con = ConnectionProvider.getCon();
			Statement st= con.createStatement();
			st.executeUpdate("UPDATE admin SET admin_sifre='"+admin_sifre+"' WHERE admin_mail='"+mail+"'");



			return true;
		}
		catch (Exception e) { System.out.println("Hata:"+e.getMessage()); System.exit(0); return false;}
		
		


}
	
	
	
	
	
	
	
	
	
	
	
}
