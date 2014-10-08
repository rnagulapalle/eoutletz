package com.eoutletz.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.mail.MailException;
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

	private Logger logger = Logger.getLogger(MailServiceImpl.class);

	// @Autowired
	// private MailSender mailSender;

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
	public void orderConfirmationEmail(User user) {
	
		sendConfirmationEmail(user);

	}

	private void sendConfirmationEmail(final User user) {
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {
				// replace this with dynamic user
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
				message.setTo(user.getEmail());
				message.setSubject("Order confirmation!");
				message.setFrom("noreply@eoutletz.com"); // could be
															// parameterized...
				Map<String, Object> model = new HashMap<String, Object>();
				model.put("user", user);
				String text = VelocityEngineUtils
						.mergeTemplateIntoString(velocityEngine,
								"templates/order-confirmation.vm", "utf-8", model);
				message.setText(text, true);
			}
		};
		try {
			this.mailSender.send(preparator);
		} catch (MailException ex) {
			logger.error("Failed with ", ex);
		}
	}

}
