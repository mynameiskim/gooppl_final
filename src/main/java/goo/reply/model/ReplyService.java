package goo.reply.model;

import java.util.List;

public interface ReplyService {
	
	public int writeReply(ReplyDTO dto);
	public List<ReplyDTO> replyList(int review_idx);
	public int replyDel(int ridx);
}
