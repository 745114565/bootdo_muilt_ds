package com.xzbd.common.controller;

import com.xzbd.system.domain.UserToken;
import org.springframework.stereotype.Controller;
import com.xzbd.common.utils.ShiroUtils;
import com.xzbd.system.domain.UserDO;

@Controller
public class BaseController {
	public UserDO getUser() {
		return ShiroUtils.getUser();
	}

	public Long getUserId() {
		return getUser().getUserId();
	}

	public String getUsername() {
		return getUser().getUsername();
	}
}