package pe.com.alquilerautorara.controller;

import java.security.Principal;
import java.util.Locale;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pe.com.alquilerautorara.model.Auto;
import pe.com.alquilerautorara.model.Reserva;
import pe.com.alquilerautorara.model.UserInfo;
import pe.com.alquilerautorara.service.AutoService;
import pe.com.alquilerautorara.service.IAutoService;
import pe.com.alquilerautorara.service.IUserInfoService;

/**
 * Controler responsável peleas urls de usuarios.
 * 
 * @author hlandim
 */
@Controller
@RequestMapping("/reserva/**")
public class ReservaController {

	@Autowired
	private IAutoService autoService;
	
	@Autowired
	private IUserInfoService userInfoService;

	@Autowired
	private MessageSource messageSource;

	/**
	 * Acesso a página principal.
	 * 
	 * @return {@link UserInfo} para o formulario.
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public Auto create() {
		return new Auto();
	}
	
	/**
	 * Acesso a página de cadastro de usuário.
	 * 
	 * @param userInfo
	 * @param result
	 * @param model
	 * @return pagina de cradastro
	 */
	@RequestMapping(value = "/inicia", method = RequestMethod.POST)
	public String inicia(@Valid Auto auto, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "user/create";
		}
//		userInfoService.save(userInfo);
//		model.addAttribute("message", messageSource.getMessage("message.user.save", null, Locale.getDefault()));
		
		System.out.println(auto.toString());
		return "redirect:/";

	}

	/**
	 * Acesso a página de cadastro de usuário.
	 * 
	 * @param userInfo
	 * @param result
	 * @param model
	 * @return pagina de cradastro
	 */
	@RequestMapping(value = "/create/save", method = RequestMethod.POST)
	public String save(@Valid Auto auto, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "auto/create";
		}
		autoService.save(auto);
		model.addAttribute("message", messageSource.getMessage("message.auto.save", null, Locale.getDefault()));
		return "redirect:/auto/create";

	}

	/**
	 * Acceso a pagina de edicion.
	 * 
	 * @param id
	 * @param model
	 * @return pagina de edicao.
	 */
	@RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") int id, Model model) {
		Auto auto = autoService.findById(id);
		model.addAttribute("auto", auto);
		return "auto/create";
	}

	/**
	 * Usado para remover un auto.
	 * 
	 * @param principal
	 * @param httpRequest
	 * @param id
	 * @param model
	 * @return deloga o usuario (se o usuario deletado for o mesmo que esta autenticado) ou retorna para pagina de listagem.
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
	public String remove(Principal principal, HttpServletRequest httpRequest, @PathVariable("id") long id,
			Model model) {
		Auto auto = autoService.findById(id);
		autoService.remover(id);
		model.addAttribute("message", messageSource.getMessage("message.auto.removed",
				new Object[] { auto.getNombre() }, Locale.getDefault()));
		return "redirect:/";
	}
	
	
	/**
	 * Utilizado para verificar se um usuario já esta cadastrdo.
	 * 
	 * @param username
	 * @return <code>true</code> se existir ou <code>false</code> caso nao exista.
	 */
	@RequestMapping(value = "/iniciaReserva", method = RequestMethod.GET)
	public String findbyId(@RequestParam Integer id, Model model) {
		
		Auto auto = autoService.findById(id);
		UserInfo userInfo = userInfoService.getAuthentication();
		
		Reserva reserva = new Reserva();
		
		reserva.setAuto(auto);
		reserva.setUserInfo(userInfo);;
				
		model.addAttribute("reserva", reserva);
		return "redirect:reserva/create";
	}

}
