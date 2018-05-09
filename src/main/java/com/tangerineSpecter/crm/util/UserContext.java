package com.tangerineSpecter.crm.util;

import javax.servlet.http.HttpServletRequest;

public class UserContext {
	public final static String USER_IN_SESSION = "USER_IN_SESSION";

	private static ThreadLocal<HttpServletRequest> local = new ThreadLocal<HttpServletRequest>();

	public static void set(HttpServletRequest request) {
		local.set(request);
	}

	public static HttpServletRequest get() {
		return local.get();
	}
}
