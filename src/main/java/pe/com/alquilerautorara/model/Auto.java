package pe.com.alquilerautorara.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Classe que representa o usuario do sistema
 * 
 * @author oscarq
 *
 */
@Entity
public class Auto {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(unique = true)
	@NotEmpty
	@Size(max = 50)
	private String nombre;

	@Column
	@NotEmpty
	private String tipo;
	
	@Column
	@NotEmpty
	private String transmision;
	
	@Column
	@NotEmpty
	private String categoria;
	
	@Column
	@NotEmpty
	private String pasajeros;
	
	@Column
	@NotEmpty
	private Double precio;

	@Column
	@NotEmpty
	private Integer capacidad;
	
//	@OneToMany(mappedBy="auto")
//    private List<Reserva> reservas;


	public Auto() {
	}
	

	public Auto(Long id, String nombre, String tipo, String transmision, String categoria, String pasajeros,
			Double precio, Integer capacidad) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.tipo = tipo;
		this.transmision = transmision;
		this.categoria = categoria;
		this.pasajeros = pasajeros;
		this.precio = precio;
		this.capacidad = capacidad;
	}

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public String getTransmision() {
		return transmision;
	}


	public void setTransmision(String transmision) {
		this.transmision = transmision;
	}


	public String getCategoria() {
		return categoria;
	}


	public void setCategoria(String categoria) {
		this.categoria = categoria;
	}


	public String getPasajeros() {
		return pasajeros;
	}


	public void setPasajeros(String pasajeros) {
		this.pasajeros = pasajeros;
	}


	public Double getPrecio() {
		return precio;
	}


	public void setPrecio(Double precio) {
		this.precio = precio;
	}


	public Integer getCapacidad() {
		return capacidad;
	}


	public void setCapacidad(Integer capacidad) {
		this.capacidad = capacidad;
	}
	

//	public List<Reserva> getReservas() {
//		return reservas;
//	}
//
//
//	public void setReservas(List<Reserva> reservas) {
//		this.reservas = reservas;
//	}


	@Override
	public String toString() {
		return "Auto [id=" + id + ", nombre=" + nombre + ", tipo=" + tipo + ", transmision=" + transmision
				+ ", categoria=" + categoria + ", pasajeros=" + pasajeros + ", precio=" + precio + ", capacidad="
				+ capacidad + "]";
	}
	
}
