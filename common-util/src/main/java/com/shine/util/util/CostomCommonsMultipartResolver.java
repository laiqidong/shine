package com.shine.util.util;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class CostomCommonsMultipartResolver extends CommonsMultipartResolver {

	private List<String> notResolverPaths;

	public List<String> getNotResolverPaths() {
		return notResolverPaths;
	}

	public void setNotResolverPaths(List<String> notResolverPaths) {
		this.notResolverPaths = notResolverPaths;
	}

	@Override
	public boolean isMultipart(HttpServletRequest request) {
		if (notResolverPaths != null && request.getServletPath() != null) {
			boolean isExists = notResolverPaths.contains(request.getServletPath());
			if (isExists)
				return false;
		}
		return (request != null && ServletFileUpload.isMultipartContent(request));
	}

}
