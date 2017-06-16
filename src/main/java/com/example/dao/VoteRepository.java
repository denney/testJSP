package com.example.dao;



import com.example.model.Vote;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface VoteRepository extends JpaRepository<Vote, Long>,JpaSpecificationExecutor<Vote> {

// eclipse 1

}
