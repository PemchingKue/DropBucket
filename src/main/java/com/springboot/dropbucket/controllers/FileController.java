/**
 * 
 */
package com.springboot.dropbucket.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.*;

import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.springboot.dropbucket.entities.Files;
import com.springboot.dropbucket.entities.User;
import com.springboot.dropbucket.repositories.FileRepository;
import com.springboot.dropbucket.repositories.UserRepository;
import com.springboot.dropbucket.security.CustomUserDetails;

/**
 * @author PK
 *
 */
@RestController
public class FileController {

	@Autowired
	FileRepository repo;
	
	@Autowired
	UserRepository uRepo;
	
	
	@PostMapping("/files")
	public String fetchFiles() {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUserDetails customUser = (CustomUserDetails)authentication.getPrincipal();
		int userId = customUser.getUserId();
		Optional<User> user = uRepo.findById(userId);

		List<Files> arr = repo.findFilesByUserId(user.get().getUserId());
		
		// create array list and add all fetch data into it
		List<Files> data = new ArrayList<Files>();
		data.addAll(arr);
		
		//modify byte data for performance fetching and removing password from user entity
		for(Files f : data) {
			f.setFileData(null);
			f.getUser().setPassword(null);
		}
		
		Gson gson = new Gson();
		
		// convert array list to JSON array
		JsonArray jsonArray = gson.toJsonTree(data).getAsJsonArray();
		
		return jsonArray.toString();
	}
	
	@PostMapping("/upload")
	public void fileUpload(@RequestParam("files") MultipartFile[] files, HttpServletResponse response) throws IOException {
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		CustomUserDetails customUser = (CustomUserDetails)authentication.getPrincipal();
		int userId = customUser.getUserId();
		Optional<User> user = uRepo.findById(userId);
		
		List<MultipartFile> arr = Arrays.asList(files);
		
		try {
			
			for(MultipartFile file : arr) {
				
				byte[] fileData = file.getBytes();
				String fileName = file.getOriginalFilename();
				String contentType = file.getContentType();
				
				Files f = new Files();
				f.setFileData(fileData);
				f.setFileName(fileName);
				f.setContentType(contentType);
				f.setUser(user.get());
				
				repo.save(f);	

			}
			
		} catch (IOException e) {
			
			e.printStackTrace();
			
		}
		
		response.sendRedirect("/dashboard?uploadsuccess=true");
	}
		
	@PostMapping("/delete")
	public void fileDelete(@RequestParam("id") int fileId) {
		repo.deleteById(fileId);
	}
	
	@GetMapping("/download")
	public ResponseEntity<byte[]> fileDownload(@RequestParam("id") int fileId) {
		Optional<Files> uFile = repo.findById(fileId);
		
		String fileName = uFile.get().getFileName();
		byte[] fileData = uFile.get().getFileData();
		String contentType = uFile.get().getContentType();

		return ResponseEntity.ok()
				.contentType(MediaType.parseMediaType(contentType))
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + fileName + "\"")
				.body(fileData);
		
	}
	
}
