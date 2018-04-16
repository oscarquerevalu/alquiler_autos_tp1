package pe.com.alquilerautorara.service;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;

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
				
//				String text = "Dear " + reserva.getUserInfo().getName()
//						+ ", thank you for placing reserve. Your reserve Number is " + reserva.getId() + ". with Date "+ reserva.getFechaReserva()+".";
				
				String html = "<h3>Dear " + reserva.getUserInfo().getName() +
						", thank you for placing reserve. Your reserve Number is " + reserva.getId() + ".</h3>"+
						"<h3><b>Detail Car</b></h3>"+
						"<h4> Category: <small> " + reserva.getAuto().getCategoria() + " </small></h4>\r\n" + 
						"<h4> Name: <small> " + reserva.getAuto().getNombre() + " </small></h4>\r\n" + 
						"<h4> Passengers: <small>" + reserva.getAuto().getPasajeros()+ " </small></h4>\r\n" + 
						"<h4> Type: <small> " + reserva.getAuto().getTipo() + " </small></h4>\r\n" + 
						"<h4> Transmission: <small> "+ reserva.getAuto().getTransmision()+ " </small></h4>"+
						"<h3><b>Detail Reserve</b></h3>"+
						"<h4>Date: <small>"+ reserva.getFechaReserva()+"</small></h4>\r\n" +
						"<h4>Price: <small>$"+ reserva.getPrecio()+"</small></h4>\r\n" ;
				
				 Multipart multipart = new MimeMultipart( "alternative" );

//				    MimeBodyPart textPart = new MimeBodyPart();
//				    textPart.setText( text, "utf-8" );

				    MimeBodyPart htmlPart = new MimeBodyPart();
				    htmlPart.setContent( html, "text/html; charset=utf-8" );

//				    multipart.addBodyPart( textPart );
				    multipart.addBodyPart( htmlPart );
				mimeMessage.setContent(multipart);
				
				mimeMessage.setSubject("Your reserve on Alquilerautosweb");
			}
		};
		return preparator;
	}

}
