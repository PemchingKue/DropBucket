/**
 * 
 */
package com.springboot.dropbucket.entities;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * @author PK
 *
 */
@Entity
@Table(name = "files")
public class Files {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "file_id")
	private int fileId;
	
	@Column(name = "file_name")
	private String fileName;
	
	@Column(name = "file_data")
	private byte[] fileData;
	
	@Column(name = "content_type")
	private String contentType;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	/**
	 * @param fileId
	 * @param fileName
	 * @param fileData
	 * @param contentType
	 * @param user
	 */
	public Files(int fileId, String fileName, byte[] fileData, String contentType, User user) {
		this.setFileId(fileId);
		this.setFileName(fileName);
		this.setFileData(fileData);
		this.setContentType(contentType);
		this.setUser(user);
	}

	public Files() {
		super();
	}

	/**
	 * @return the fileId
	 */
	public int getFileId() {
		return fileId;
	}

	/**
	 * @param fileId the fileId to set
	 */
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}

	/**
	 * @return the fileName
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * @param fileName the fileName to set
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * @return the fileData
	 */
	public byte[] getFileData() {
		return fileData;
	}

	/**
	 * @param fileData the fileData to set
	 */
	public void setFileData(byte[] fileData) {
		this.fileData = fileData;
	}

	/**
	 * @return the contentType
	 */
	public String getContentType() {
		return contentType;
	}

	/**
	 * @param contentType the contentType to set
	 */
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	/**
	 * @return the user
	 */
	public User getUser() {
		return user;
	}

	/**
	 * @param user the user to set
	 */
	public void setUser(User user) {
		this.user = user;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((contentType == null) ? 0 : contentType.hashCode());
		result = prime * result + Arrays.hashCode(fileData);
		result = prime * result + fileId;
		result = prime * result + ((fileName == null) ? 0 : fileName.hashCode());
		result = prime * result + ((user == null) ? 0 : user.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Files other = (Files) obj;
		if (contentType == null) {
			if (other.contentType != null)
				return false;
		} else if (!contentType.equals(other.contentType))
			return false;
		if (!Arrays.equals(fileData, other.fileData))
			return false;
		if (fileId != other.fileId)
			return false;
		if (fileName == null) {
			if (other.fileName != null)
				return false;
		} else if (!fileName.equals(other.fileName))
			return false;
		if (user == null) {
			if (other.user != null)
				return false;
		} else if (!user.equals(other.user))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Files [fileId=");
		builder.append(fileId);
		builder.append(", fileName=");
		builder.append(fileName);
		builder.append(", fileData=");
		builder.append(Arrays.toString(fileData));
		builder.append(", contentType=");
		builder.append(contentType);
		builder.append(", user=");
		builder.append(user);
		builder.append("]");
		return builder.toString();
	}

}
