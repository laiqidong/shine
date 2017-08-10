package com.shine.util.util;

import org.apache.commons.lang3.StringUtils;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by luoxuan on 2017/5/9.
 * Description:
 */

public class FrameFilter implements Filter {

    private String[] excludedPages;
    private String excluded;

    public String[] getExcludedPages() {
        return excludedPages;
    }

    public void setExcludedPages(String[] excludedPages) {
        this.excludedPages = excludedPages;
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.excluded = filterConfig.getInitParameter("excludedPages");
        if (StringUtils.isNotEmpty(excluded)) {
            excludedPages = this.excluded.split(",");
        }
        return;

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpServletRequest request = (HttpServletRequest) servletRequest;
//        response.setHeader("X-Frame-OPTIONS", "ALLOW-FROM http://192.168.1.123");
        if (this.excluded.indexOf(request.getServletPath()) < 0) {
            response.setHeader("X-Frame-OPTIONS", "SAMEORIGIN");
        }
        //转到页面
        filterChain.doFilter(servletRequest, response);
    }

    @Override
    public void destroy() {

    }
}
