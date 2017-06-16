package com.example.service;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.model.Vote;

@Service
@Transactional
public class VoteService {
	private final VoteRepository voteRepository;

	public VoteService(VoteRepository voteRepository) {
		this.voteRepository = voteRepository;
	}

	/**
	 * 保存vote信息
	 */
	public Vote save(Vote vote) {
		return voteRepository.save(vote);
	}


	public Page<Vote> findAll(int page, int size, String direction, String property) {
		Pageable pageable = null;
		if ("asc".equals(direction)) {
			pageable = new PageRequest(page, size, Direction.ASC, property);
		} else {
			pageable = new PageRequest(page, size, Direction.DESC, property);
		}
		return voteRepository.findAll(pageable);

	}


	public Vote findOneById(Long id) {
		return voteRepository.findOne(id);

	}

	public void deleteById(Long id) {
		voteRepository.delete(id);
	}

}
