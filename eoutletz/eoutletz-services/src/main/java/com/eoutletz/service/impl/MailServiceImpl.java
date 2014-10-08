package com.eoutletz.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import com.eoutletz.common.log.Logger;
import com.eoutletz.persist.entity.User;
import com.eoutletz.service.MailService;

@Service
public class MailServiceImpl implements MailService {

	private Logger logger  = Logger.getLogger(MailServiceImpl.class);
	
	@Autowired
	//private MailSender mailSender;
	
	private JavaMailSender mailSender;
    private VelocityEngine velocityEngine;
	
    
    
	public JavaMailSender getMailSender() {
		return mailSender;
	}

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public VelocityEngine getVelocityEngine() {
		return velocityEngine;
	}

	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}

	@Override
	public void orderConfirmationEmail(String toEmail) {
//		SimpleMailMessage message = new SimpleMailMessage();
//        message.setTo(toEmail);
//        message.setSubject("Hello World");
//        message.setText("Sample body");
//        try{
//            this.mailSender.send(message);
//        }
//        catch (MailException ex) {
//        	logger.error("Failed with ", ex);
//        }
		
//		MimeMessagePreparator preparator = new MimeMessagePreparator() {
//            public void prepare(MimeMessage mimeMessage) throws Exception {
//            	
//            	User user = new User();
//        		user.setEmail("raj.jsp@gmail.com");
//        		user.setFirstName("Raj");
//        		
//                MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
//                message.setTo(user.getEmail());
//                message.setFrom("webmaster@csonth.gov.uk"); // could be parameterized...
//                Map model = new HashMap();
//                model.put("user", user);
//                String text = VelocityEngineUtils.mergeTemplateIntoString(
//                        velocityEngine, "order-confirmation.vm", model);
//                message.setText(text, true);
//            }
//        };
//        this.mailSender.send(preparator);
	}

}
