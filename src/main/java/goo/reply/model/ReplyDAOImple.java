package goo.reply.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class ReplyDAOImple implements ReplyDAO {

	private SqlSessionTemplate sqlMap;

	public ReplyDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public int writeReply(ReplyDTO dto) {
		int result = sqlMap.insert("writeReply", dto);
		return result;
	}
	
	public List<ReplyDTO> replyList(int review_idx) {
		List<ReplyDTO> list = sqlMap.selectList("replyList",review_idx);
		return list;
	}

	public int replyDel(int ridx) {
		int result = sqlMap.delete("replyDel", ridx);
		return result;
	}
	public int getReplyCount(int review_idx) {
		int count = sqlMap.selectOne("getReplyCount",review_idx);
		return count;
	}
}
