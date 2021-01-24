/**
 * 
 */
package com.springboot.dropbucket.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.springboot.dropbucket.entities.Files;
import java.util.*;

/**
 * @author PK
 *
 */
public interface FileRepository extends JpaRepository<Files, Integer> {

	@Query("SELECT f FROM Files f WHERE f.user.userId = :userId")
	List<Files> findFilesByUserId(int userId);
}
