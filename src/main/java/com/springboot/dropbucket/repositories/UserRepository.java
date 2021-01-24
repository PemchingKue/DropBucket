/**
 * 
 */
package com.springboot.dropbucket.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.springboot.dropbucket.entities.User;

/**
 * @author PK
 *
 */
public interface UserRepository extends JpaRepository<User, Integer> {

	@Query("SELECT u FROM User u WHERE u.email = ?1")
	User findByEmail(String email);
}
