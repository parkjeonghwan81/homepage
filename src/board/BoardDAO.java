package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import utility.DBClose;
import utility.DBOpen;

public class BoardDAO {

	public int total(Map map) {

		String col = (String) map.get("col");
		String word = (String) map.get("word");

		int total = 0;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(*)  ");
		sql.append(" FROM board  ");
		if (word.trim().length() > 0)
			sql.append(" where " + col + " like '%'||?||'%' ");

		try {

			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
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

	public List<BoardDTO> list(Map map) {
		String col = (String) map.get("col");
		String word = (String) map.get("word");
		int sno = (Integer) map.get("sno");
		int eno = (Integer) map.get("eno");

		List<BoardDTO> list = new ArrayList<BoardDTO>();
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT boardno, wname, title, viewcnt, wdate, grpno,  ");
		sql.append(" indent, ansnum,  r ");
		sql.append(" From( ");
		sql.append(" SELECT boardno, wname, title, viewcnt, wdate, grpno,  ");
		sql.append(" indent, ansnum, rownum as r ");
		sql.append(" FROM (  ");
		sql.append(" 			SELECT boardno, wname, title, viewcnt, wdate, grpno, indent, ansnum  ");
		sql.append(" 			FROM board  ");
		if (word.trim().length() > 0) // 랭스에 괄호가 없는건 배열밖에없음 trim() : 양쪽에 빈문자열
										// 없애줌*/
			sql.append(" where " + col + " like '%'||?||'%' "); // ||오라클의
																// 추력기호(?)
		sql.append(" ORDER BY grpno DESC,ansnum ");
		sql.append(" )  ");
		sql.append(" )where r >= ? and r <= ? ");

		try {
			int i = 0;

			pstmt = con.prepareStatement(sql.toString());
			if (word.trim().length() > 0)
				pstmt.setString(++i, word);
			pstmt.setInt(++i, sno);
			pstmt.setInt(++i, eno);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setBoardno(rs.getInt("boardno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));

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

	public boolean getRefnum(int Boardno) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append("SELECT COUNT(*)  ");
		sql.append("FROM board  ");
		sql.append("WHERE refnum=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, Boardno);

			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1); // index번호

			if (cnt > 0)
				flag = true;// 부모글

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return flag;
	}

	public void upAnsnum(Map map) { // ansnum 올려주는작업

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE board  ");
		sql.append(" SET ansnum = ansnum + 1  ");
		sql.append(" WHERE grpno=? and ansnum > ? "); // 답변쓸려고하는 부모글의 값이 들어가햐함
		int grpno = (Integer) map.get("grpno");
		int ansnum = (Integer) map.get("ansnum");
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, grpno);
			pstmt.setInt(2, ansnum);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}
	}

	public boolean replyCreate(BoardDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO board(boardno, wname, title, content, passwd, wdate, grpno, indent, ansnum, refnum) ");
		sql.append(" VALUES((SELECT NVL(MAX(Boardno), 0) + 1 as boardno FROM board),  ");
		sql.append(" ?, ?, ?, ?, sysdate, ? , ?, ?, ?) ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());
			pstmt.setInt(5, dto.getGrpno()); // 부모의 grpno
			pstmt.setInt(6, dto.getIndent() + 1); // 부모의 indent + 1
			pstmt.setInt(7, dto.getAnsnum() + 1); // 부모의 ansnum + 1
			pstmt.setInt(8, dto.getBoardno()); // 부모의 Boardno(refnum에 들어감)

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;

	}

	public BoardDTO replyRead(int boardno) {
		BoardDTO dto = null;

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT boardno, title, grpno, indent, ansnum ");
		sql.append(" FROM Board   ");
		sql.append(" WHERE boardno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, boardno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new BoardDTO();
				dto.setBoardno(rs.getInt("boardno"));
				dto.setTitle(rs.getString("title"));
				dto.setGrpno(rs.getInt("grpno"));
				dto.setIndent(rs.getInt("indent"));
				dto.setAnsnum(rs.getInt("ansnum"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);

		}
		return dto;
	}

	public void upViewcnt(int boardno) {

		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE board  ");
		sql.append(" SET viewcnt = viewcnt + 1  ");
		sql.append(" WHERE boardno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, boardno);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0) {
				System.out.println("조회수 증가 성공");
			} else {
				System.out.println("조회수 증가 실패");
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

	}

	public boolean passwdCheck(Map map) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT COUNT(boardno)  ");
		sql.append(" FROM board  ");
		sql.append(" WHERE boardno=? AND passwd=? ");

		int boardno = (Integer) map.get("boardno");
		String passwd = (String) map.get("passwd");
		
		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, boardno);
			pstmt.setString(2, passwd);

			rs = pstmt.executeQuery();
			rs.next();
			int cnt = rs.getInt(1); // index번호

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}

		return flag;
	}


	public boolean delete(int boardno) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" DELETE FROM board WHERE boardno=? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, boardno);

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBClose.close(pstmt, con);

		return flag;
	}

	public boolean update(BoardDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" UPDATE board  ");
		sql.append(" SET  ");
		sql.append(" wname=		?,  ");
		sql.append(" title=		?,  ");
		sql.append(" content=	?  ");
		sql.append(" WHERE boardno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setInt(4, dto.getBoardno());

			int cnt = pstmt.executeUpdate();

			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

	public BoardDTO read(int boardno) {
		BoardDTO dto = null;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" SELECT boardno, wname, title, content, viewcnt, wdate ");
		sql.append(" FROM board   ");
		sql.append(" WHERE boardno = ? ");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setInt(1, boardno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dto = new BoardDTO();
				dto.setBoardno(rs.getInt("boardno"));
				dto.setWname(rs.getString("wname"));
				dto.setTitle(rs.getString("title"));
				dto.setViewcnt(rs.getInt("viewcnt"));
				dto.setWdate(rs.getString("wdate"));
				dto.setContent(rs.getString("content"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(rs, pstmt, con);
		}
		return dto;
	}

	
	public boolean create(BoardDTO dto) {
		boolean flag = false;
		Connection con = DBOpen.getConnection();
		PreparedStatement pstmt = null;

		StringBuffer sql = new StringBuffer();
		sql.append(" INSERT INTO board(boardno, wname, title, content, passwd, wdate,grpno)   ");
		sql.append(" VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board),  ");
		sql.append(" ?, ?, ?, ?, sysdate, ");
		sql.append(" (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM board))");

		try {
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getPasswd());

			int cnt = pstmt.executeUpdate();
			if (cnt > 0)
				flag = true;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBClose.close(pstmt, con);
		}

		return flag;
	}

}
