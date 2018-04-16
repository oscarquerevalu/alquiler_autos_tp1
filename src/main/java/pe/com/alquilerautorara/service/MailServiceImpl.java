package pe.com.alquilerautorara.service;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import pe.com.alquilerautorara.model.Reserva;

@Component
public class MailServiceImpl implements MailService {

	@Autowired
	JavaMailSender mailSender;

	@Override
	public void sendEmail(Object object) {

		Reserva reserva = (Reserva) object;

		MimeMessagePreparator preparator = getMessagePreparator(reserva);

		try {
//			SimpleMailMessage message = new SimpleMailMessage(); 
//	        message.setTo(reserva.getUserInfo().getEmail()); 
//	        message.setSubject("Your order on Alquilerautoswe	b"); 
//	        message.setText("Dear " + reserva.getUserInfo().getName()
//					+ ", thank you for placing order. Your order id is " + reserva.getId() + ".");
//	        mailSender.send(message);
			mailSender.send(preparator);
			System.out.println("Message Send...Hurrey");
		} catch (MailException ex) {
			System.err.println(ex.getMessage());
		}
	}

	private MimeMessagePreparator getMessagePreparator(final Reserva reserva) {

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setFrom(new InternetAddress("alquilerautosrara@gmail.com", "Alquiler Autos Rara"));
				mimeMessage.setRecipient(Message.RecipientType.TO,
						new InternetAddress(reserva.getUserInfo().getEmail()));
				mimeMessage.setText("Dear " + reserva.getUserInfo().getName()
						+ ", thank you for placing reserve. Your reserve id is " + reserva.getId() + ".");
				mimeMessage.setSubject("Your reserve on Alquilerautosweb");
			}
		};
		return preparator;
	}

}
