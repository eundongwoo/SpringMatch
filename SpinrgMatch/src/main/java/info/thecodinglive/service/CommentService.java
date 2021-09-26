package info.thecodinglive.service;

import java.util.List;

import org.springframework.stereotype.Service;

import info.thecodinglive.model.Comment;
import info.thecodinglive.repository.CommentRepository;

@Service
public class CommentService {
	private final CommentRepository commentRepository;
	public CommentService(CommentRepository commentRepository) {
		this.commentRepository=commentRepository;
	}
	
	public void save(Comment comment) {
		commentRepository.save(comment);
	}
	
	public List<Comment> findAllByArticle(Integer articleNo) {
		return commentRepository.findAllCommentByArticleNo(articleNo);
	}
	
	public void deleteById(Integer commentNum) {
		commentRepository.deleteById(commentNum);
	}
	
}
