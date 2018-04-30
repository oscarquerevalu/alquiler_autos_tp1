package pe.com.alquilerautorara.controller;

import java.io.IOException;
import java.security.Principal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
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
import org.springframework.web.servlet.ModelAndView;

import pe.com.alquilerautorara.model.Auto;
import pe.com.alquilerautorara.model.Reserva;
import pe.com.alquilerautorara.model.UserInfo;
import pe.com.alquilerautorara.service.IAutoService;
import pe.com.alquilerautorara.service.IReservaService;
import pe.com.alquilerautorara.service.IUserInfoService;
import pe.com.alquilerautorara.service.MailService;

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
	private IReservaService reservaService;

	@Autowired
	private MessageSource messageSource;
	
	@Autowired
	MailService mailService;

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
	public String save(Locale locale, @Valid Reserva reserva, BindingResult result, Model model) {
		if (result.hasErrors()) {
			return "reserva/reservar";
		}
		UserInfo userInfo = userInfoService.getAuthentication();
		if(Objects.nonNull(reservaService.findByDateReserve(userInfo.getId(),reserva.getFechaReservaIni(), reserva.getFechaReservaFin()))) {
			model.addAttribute("alert", messageSource.getMessage("create.message.fechaReserva", null, Locale.getDefault()));
			return "reserva/reservar";
		}
		
		Auto auto = autoService.findById(reserva.getAuto().getId());
		
		reserva.setAuto(auto);
		reserva.setUserInfo(userInfo);
		long elapsedDays = ChronoUnit.DAYS.between(reserva.getFechaReservaIni(), reserva.getFechaReservaFin()) + 1;
		reserva.setPrecio((elapsedDays*(auto.getPrecio() + auto.getSeguroVehiculo())));
		reservaService.save(reserva);
		mailService.sendEmail(locale,reserva);
		model.addAttribute("message", messageSource.getMessage("message.reserva.save", null, Locale.getDefault()));
		return "redirect:/";

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
		Reserva reserva = reservaService.findById(id);
		model.addAttribute("reserva", reserva);
		return "reserva/reservar";
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
	@Secured("ROLE_USER")
	@RequestMapping(value = "/remove/{id}", method = RequestMethod.GET)
	public String remove(Principal principal, HttpServletRequest httpRequest, @PathVariable("id") long id,
			Model model) {
		Reserva reserva = reservaService.findById(id);
		reservaService.remover(id);
		model.addAttribute("message", messageSource.getMessage("message.reserva.removed",
				new Object[] { reserva.getFechaReservaIni() +" - "+  reserva.getFechaReservaFin()}, Locale.getDefault()));
		return "redirect:/";
	}
	
	
	/**
	 * Acceso a pagina de edicion.
	 * 
	 * @param id
	 * @param model
	 * @return pagina de edicao.
	 */
	@RequestMapping(value = "/iniciaReserva/{id}", method = RequestMethod.GET)
	public String findbyId(@PathVariable("id") int id, Model model) {
		Auto auto = autoService.findById(id);
		UserInfo userInfo = userInfoService.getAuthentication();
		
		Reserva reserva = new Reserva();
		
		reserva.setAuto(auto);
		reserva.setUserInfo(userInfo);
		reserva.setPrecio(reserva.getAuto().getPrecio());
		reserva.setEstado("RESERVADO");
		model.addAttribute("reserva", reserva);
		return "reserva/reservar";
	}
	
	/**
	 * Metodo Request para view home
	 * @param httpRequest
	 * @return pagina home.
	 * @throws IOException
	 */
	@RequestMapping(value = "/list")
	public ModelAndView listByUser(HttpServletRequest httpRequest) throws IOException {
		
		UserInfo userInfo = userInfoService.getAuthentication();
		ModelAndView modelAndView = new ModelAndView("reserva/list");
		modelAndView.addObject("reservas", reservaService.listByUser(userInfo.getId()));
		modelAndView.addObject("usuarioLogado", userInfo);
		return modelAndView;
	}
	
	/**
	 * Utilizado para verificar se um usuario já esta cadastrdo.
	 * 
	 * @param fechaIni
	 * @param fechaFin
	 * @return <code>true</code> se existir ou <code>false</code> caso nao exista.
	 */
	@RequestMapping(value = "/checkreserve",headers="Accept=*/*",produces="application/json", method = RequestMethod.GET)
	public @ResponseBody String checkReserveExist(@RequestParam  String fechaIni,@RequestParam String  fechaFin) {
		UserInfo userInfo = userInfoService.getAuthentication();

	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
	    LocalDate dfechaIni = LocalDate.parse(fechaIni, formatter);
	    LocalDate dfechaFin = LocalDate.parse(fechaFin, formatter);
		return String.valueOf(Objects.nonNull(reservaService.findByDateReserve(userInfo.getId(),dfechaIni, dfechaFin)));
	}

}
