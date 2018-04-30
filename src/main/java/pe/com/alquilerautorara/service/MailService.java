package pe.com.alquilerautorara.service;

import java.util.Locale;

public interface MailService {

	public void sendEmail(final Locale locale,final Object object);
}
