package goo.reply.model;

import java.util.List;

public class ReplyServiceImple implements ReplyService {

	private ReplyDAO replyDao;
	
	public ReplyServiceImple(ReplyDAO replyDao) {
		super();
		this.replyDao = replyDao;
	}

	public int writeReply(ReplyDTO dto) {
		int result = replyDao.writeReply(dto);
		return result;
	}
	
	public List<ReplyDTO> replyList(int review_idx) {
		List<ReplyDTO> list = replyDao.replyList(review_idx);
		return list;
	}
	
	public int replyDel(int ridx) {
		int result = replyDao.replyDel(ridx);
		return result;
	}

}
