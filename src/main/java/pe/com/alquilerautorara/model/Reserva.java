package pe.com.alquilerautorara.model;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Classe que representa o usuario do sistema
 * 
 * @author oscarq
 *
 */
@Entity
public class Reserva {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@ManyToOne(optional=false)
    @JoinColumn(name="id_auto", referencedColumnName="id")
    private Auto auto;
	
	@ManyToOne(optional=false)
    @JoinColumn(name="id_userinfo", referencedColumnName="id")
    private UserInfo userInfo;

	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column
	@NotNull
	private LocalDate fechaReserva;
	
	@Column
	@NotEmpty
	private Double precio;
	

	public Reserva() {
	}

	public Reserva(Long id, Auto auto, UserInfo userInfo, LocalDate fechaReserva, Double precio) {
		super();
		this.id = id;
		this.auto = auto;
		this.userInfo = userInfo;
		this.fechaReserva = fechaReserva;
		this.precio = precio;
	}

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Auto getAuto() {
		return auto;
	}


	public void setAuto(Auto auto) {
		this.auto = auto;
	}


	public LocalDate getFechaReserva() {
		return fechaReserva;
	}


	public void setFechaReserva(LocalDate fechaReserva) {
		this.fechaReserva = fechaReserva;
	}


	public Double getPrecio() {
		return precio;
	}


	public void setPrecio(Double precio) {
		this.precio = precio;
	}

	public UserInfo getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	@Override
	public String toString() {
		return "Reserva [id=" + id + ", auto=" + auto + ", userInfo=" + userInfo + ", fechaReserva=" + fechaReserva
				+ ", precio=" + precio + "]";
	}
	
	
	
	

}
