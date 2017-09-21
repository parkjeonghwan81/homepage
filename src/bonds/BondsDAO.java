package bonds;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class BondsDAO {
	
	public String getGrade(String id){
		String grade = null;
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select grade ");
		sql.append(" from bonds ");
		sql.append(" where id = ?  ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()){
				grade = rs.getString("grade");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return grade;
	}
	
	public boolean loginCheck(Map map){
		boolean flag = false;
		
		String id = (String)map.get("id");
		String passwd = (String)map.get("passwd");
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from bonds ");
		sql.append(" where id = ? ");
		sql.append(" and passwd = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			int cnt = rs.getInt(1);
			
			if(cnt>0)flag = true;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return flag;
	}
	
	public boolean delete(String id){
		boolean flag = false;
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" delete from bonds ");
		sql.append(" where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	public String getFname(String id){
		String fname=null;
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select fname ");
		sql.append(" from bonds ");
		sql.append(" where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()){  //데이터가 없을수도 있기때문에
				fname=rs.getString("fname");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		
		return fname;
	}
	
	public boolean updatePw(Map map){
		boolean flag=false;
		
		String passwd = (String)map.get("passwd");
		String id = (String)map.get("id");
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update bonds ");
		sql.append(" set passwd = ? ");
		sql.append(" where id = ? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, passwd);
			pstmt.setString(2, id);
			
			int cnt = pstmt.executeUpdate();
			
			if(cnt>0) flag = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
	
	
	public boolean update(BondsDTO dto){
		boolean flag = false;
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" update bonds ");
		sql.append(" set tel = ?, ");
		sql.append(" 	 email = ?, ");
		sql.append(" 	 zipcode = ?, ");
		sql.append(" 	 address1 = ?, ");
		sql.append(" 	 address2 = ?, ");
		sql.append(" 	 fname = ?, ");
		sql.append(" 	 bname = ?, ");
		sql.append(" 	 job = ? ");
		sql.append(" where id = ? ");
		
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getTel());  //updateproc에서 setproperty
			pstmt.setString(2, dto.getEmail());
			pstmt.setString(3, dto.getZipcode());
			pstmt.setString(4, dto.getAddress1());
			pstmt.setString(5, dto.getAddress2());
			pstmt.setString(6, dto.getFname());
			pstmt.setString(7, dto.getBname());
			pstmt.setString(8, dto.getJob());
			pstmt.setString(9, dto.getId());
			
			int cnt = pstmt.executeUpdate();
			if(cnt>0) flag=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(pstmt, con);
		}
		
		return flag;
	}
	
	
	public BondsDTO read(String id){
		BondsDTO dto = null;
		
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select * from bonds where id = ? ");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				dto = new BondsDTO();
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setBname(rs.getString("bname"));
				dto.setEmail(rs.getString("email"));
				dto.setFname(rs.getString("fname"));
				dto.setGrade(rs.getString("grade"));
				dto.setId(rs.getString("id"));
				dto.setJdate(rs.getString("jdate"));
				dto.setJob(rs.getString("job"));
				dto.setTel(rs.getString("tel"));
				dto.setZipcode(rs.getString("zipcode"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}

	public int total(Map map){
		int total=0;

		String col = (String)map.get("col");
		String word = (String)map.get("word");

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from bonds ");
		if(word.trim().length()>0)
			sql.append(" where" + col + "like '%'||?||'%'");

		try {
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0)
				pstmt.setString(1, word);

			rs = pstmt.executeQuery();
			rs.next();
			total = rs.getInt(1);

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return total;

	}


	public List<BondsDTO> list(Map map){
		List<BondsDTO> list = new ArrayList<BondsDTO>();

		int sno = (Integer)map.get("sno");
		int eno = (Integer)map.get("eno");
		String col = (String)map.get("col");
		String word = (String)map.get("word");
		System.out.println("col = " + col);
		System.out.println("word = " +word);
		System.out.println("sno = " +sno);
		System.out.println("eno = " +eno);

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
				sql.append(" select id,passwd,bname,email,zipcode,address1,address2,job,jdate,tel,fname,grade,r ");
				sql.append(" from( ");
				sql.append(" 	select id, passwd, bname, email,zipcode,address1,address2,job,jdate,tel,fname,grade,rownum as r ");
				sql.append(" 	from ( ");
				sql.append(" 		select id,passwd, bname,email,zipcode, address1,address2,job,jdate,tel,fname,grade ");
				sql.append(" 		from bonds ");
				if(word.trim().length()>0)
					sql.append(" where " + col + " like '%'||?||'%'");
				sql.append(" 		) ");
				sql.append(" 	) where r>=? and r<=? ");


		try {
			int i =0;
			pstmt = con.prepareStatement(sql.toString());
			if(word.trim().length()>0){
				pstmt.setString(++i, word);}
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();

			while(rs.next()){
				BondsDTO dto = new BondsDTO();
				dto.setId(rs.getString("id"));
				dto.setAddress1(rs.getString("address1"));
				dto.setAddress2(rs.getString("address2"));
				dto.setBname(rs.getString("bname"));
				dto.setEmail(rs.getString("email"));
				dto.setFname(rs.getString("fname"));
				dto.setJdate(rs.getString("jdate"));
				dto.setJob(rs.getString("job"));
				dto.setPasswd(rs.getString("passwd"));
				dto.setTel(rs.getString("tel"));
				dto.setZipcode(rs.getString("zipcode"));

				list.add(dto);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return list;
	}

	public boolean create(BondsDTO dto){
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" insert into bonds( id, passwd, bname, tel, email, zipcode, address1, address2, ");
		sql.append("  fname, job, jdate, grade) ");
		sql.append(" values( ?, ?, ?, ?, ?, ?, ?, ");
		sql.append("  ?, ?, ?, sysdate, 'H' ) ");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			pstmt.setString(3, dto.getBname());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getEmail());
			pstmt.setString(6, dto.getZipcode());
			pstmt.setString(7, dto.getAddress1());
			pstmt.setString(8, dto.getAddress2());
			pstmt.setString(9, dto.getFname());
			pstmt.setString(10, dto.getJob());

			int cnt = pstmt.executeUpdate();
			if(cnt>0) flag=true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

	public boolean duplicated(String id) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from bonds ");
		sql.append(" where id=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1);
			if(cnt>0) flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}

	public boolean duplicateEmail(String email) {
		boolean flag = false;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" select count(*) ");
		sql.append(" from bonds ");
		sql.append(" where email=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();
			rs.next();

			int cnt = rs.getInt(1);
			if(cnt>0) flag=true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return flag;
	}

}
