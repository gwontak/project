package com.pinmall.service;

import com.pinmall.dto.EmailDTO;

public interface EmailService {

	public void sendMail(EmailDTO dto, String authcode);
}
