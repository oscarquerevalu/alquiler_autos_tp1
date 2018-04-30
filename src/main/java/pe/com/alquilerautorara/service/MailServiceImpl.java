package pe.com.alquilerautorara.service;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Component;
import org.springframework.ui.freemarker.FreeMarkerTemplateUtils;

import freemarker.template.Configuration;
import pe.com.alquilerautorara.model.Reserva;
import pe.com.alquilerautorara.model.UserInfo;

@Component
public class MailServiceImpl implements MailService {

	@Autowired
	JavaMailSender mailSender;
	
	@Autowired
	Configuration freemarkerConfiguration;
	
	@Autowired
	private MessageSource messageSource;

	@Override
	public void sendEmail(Locale locale,Object object) {
		MimeMessagePreparator preparator = getMessagePreparator(locale,object);			
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

	private MimeMessagePreparator getMessagePreparator(final Locale locale,final Object obj) {

		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			public void prepare(MimeMessage mimeMessage) throws Exception {
				mimeMessage.setFrom(new InternetAddress("alquilerautosrara@gmail.com", "Alquiler Autos Rara"));
				String html = "";
				if(obj instanceof Reserva) {
					Reserva reserva = (Reserva) obj;
					mimeMessage.setRecipient(Message.RecipientType.TO,
							new InternetAddress(reserva.getUserInfo().getEmail()));
					
					html = messageSource.getMessage("message.mail.reserva",
							new Object[] { 	reserva.getUserInfo().getName(),
											reserva.getId(),
											reserva.getAuto().getCategoria(),
											reserva.getAuto().getNombre(),
											reserva.getAuto().getPasajeros(),
											reserva.getAuto().getTipo(),
											reserva.getAuto().getTransmision(),
											reserva.getFechaReservaIni(),
											reserva.getFechaReservaFin(),
											reserva.getPrecio()
											}, locale);
					
//					html = "<h3>Dear " + reserva.getUserInfo().getName() +
//							", thank you for placing reserve. Your reserve Number is " + reserva.getId() + ".</h3>"+
//							"<h3><b>Detail Car</b></h3>"+
//							"<h4> Category: <small> " + reserva.getAuto().getCategoria() + " </small></h4>\r\n" + 
//							"<h4> Name: <small> " + reserva.getAuto().getNombre() + " </small></h4>\r\n" + 
//							"<h4> Passengers: <small>" + reserva.getAuto().getPasajeros()+ " </small></h4>\r\n" + 
//							"<h4> Type: <small> " + reserva.getAuto().getTipo() + " </small></h4>\r\n" + 
//							"<h4> Transmission: <small> "+ reserva.getAuto().getTransmision()+ " </small></h4>"+
//							"<h3><b>Detail Reserve</b></h3>"+
//							"<h4>Date: <small>"+ reserva.getFechaReservaIni()+" to "+ reserva.getFechaReservaFin()+" </small></h4>\r\n" +
//							"<h4>Price: <small>$"+ reserva.getPrecio()+"</small></h4>\r\n" ;
					mimeMessage.setSubject(messageSource.getMessage("message.mail.reserva.title",null, locale));
				}
				if(obj instanceof UserInfo) {
					UserInfo user = (UserInfo) obj;
					mimeMessage.setRecipient(Message.RecipientType.TO,
							new InternetAddress(user.getEmail()));
	               	Map<String, Object> model = new HashMap<String, Object>();
	                model.put("user", user);
	                model.put("part1", messageSource.getMessage("message.welcome.part1",null, locale));
	                model.put("part2", messageSource.getMessage("message.welcome.part2",null, locale));
	                model.put("body", messageSource.getMessage("message.welcome.body",null, locale));
	                
	                html = geFreeMarkerTemplateContent(model);
	                System.out.println("Template content : "+html);
	                mimeMessage.setSubject(messageSource.getMessage("message.welcome.title",null, locale));
				}
				
				
				 Multipart multipart = new MimeMultipart( "alternative" );

//				    MimeBodyPart textPart = new MimeBodyPart();
//				    textPart.setText( text, "utf-8" );

				    MimeBodyPart htmlPart = new MimeBodyPart();
				    htmlPart.setContent( html, "text/html; charset=utf-8" );

//				    multipart.addBodyPart( textPart );
				    multipart.addBodyPart( htmlPart );
				mimeMessage.setContent(multipart);
				
				
			}
		};
		return preparator;
	}
	
	public String geFreeMarkerTemplateContent(Map<String, Object> model){
		StringBuffer content = new StringBuffer();
		try{
         content.append(FreeMarkerTemplateUtils.processTemplateIntoString( 
        		 freemarkerConfiguration.getTemplate("fm_mailWelcome.txt"),model));
         return content.toString();
		}catch(Exception e){
			System.out.println("Exception occured while processing fmtemplate:"+e.getMessage());
		}
	      return "";
	}


}
