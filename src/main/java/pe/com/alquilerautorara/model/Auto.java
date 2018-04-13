package pe.com.alquilerautorara.model;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;

/**
 * Classe que representa o usuario do sistema
 * 
 * @author oscarq
 *
 */
@Entity
public class Auto implements Serializable{

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
	private Integer cantidad;

	@Column
	@NotEmpty
	private Integer capacidad;
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy="auto", cascade = CascadeType.ALL)
    private Set<Reserva> reservas;
	
	@Transient
	private boolean disponible;


	public Auto() {
	}
	
	
	public Auto(Long id, String nombre, String tipo, String transmision, String categoria, String pasajeros,
			Double precio, Integer cantidad, Integer capacidad, Set<Reserva> reservas) {
		super();
		this.id = id;
		this.nombre = nombre;
		this.tipo = tipo;
		this.transmision = transmision;
		this.categoria = categoria;
		this.pasajeros = pasajeros;
		this.precio = precio;
		this.cantidad = cantidad;
		this.capacidad = capacidad;
		this.reservas = reservas;
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
	

	public Set<Reserva> getReservas() {
		return reservas;
	}


	public void setReservas(Set<Reserva> reservas) {
		this.reservas = reservas;
	}


	@Override
	public String toString() {
		return "Auto [id=" + id + ", nombre=" + nombre + ", tipo=" + tipo + ", transmision=" + transmision
				+ ", categoria=" + categoria + ", pasajeros=" + pasajeros + ", precio=" + precio + ", capacidad="
				+ capacidad + "]";
	}


	public Integer getCantidad() {
		return cantidad;
	}


	public void setCantidad(Integer cantidad) {
		this.cantidad = cantidad;
	}


	public boolean isDisponible() {
		return disponible;
	}


	public void setDisponible(boolean disponible) {
		this.disponible = disponible;
	}
	
	
	
}
