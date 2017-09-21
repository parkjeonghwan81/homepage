package board;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

public class ReplyDAO {
	
	
	public int rcount(int bbsno){
	    return mybatis.selectOne("reply.total", bbsno);
	}
	
	public void setMybatis(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}

	public List<ReplyDTO> list(Map map) {
		
		return mybatis.selectList("reply.list", map);
	}

	public int total(int bbsno) {
		
		return mybatis.selectOne("reply.total", bbsno);
	}

	public boolean create(ReplyDTO dto) {
/*		boolean flag=false;
		int cnt = mybatis.insert("reply.create", dto);
		if(cnt>0) flag=true; */
		return (mybatis.insert("reply.create", dto)>0);
	}

	public ReplyDTO read(int rnum) {
		return mybatis.selectOne("reply.read", rnum);
	}

	public boolean update(ReplyDTO dto) {
		return (mybatis.update("reply.update", dto)>0);
	}

	public boolean delete(int rnum) {
		return (mybatis.delete("reply.delete", rnum)>0);
	}
	
}
