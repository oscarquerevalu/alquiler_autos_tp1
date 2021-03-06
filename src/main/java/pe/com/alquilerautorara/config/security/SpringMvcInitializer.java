package pe.com.alquilerautorara.config.security;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import pe.com.alquilerautorara.config.AppConfig;

/**
 * Classe usada pelo Spring Security para configuração.
 * @author hlandim
 *
 */
public class SpringMvcInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { AppConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return null;
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}

}
