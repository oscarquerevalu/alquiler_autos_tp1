package pe.com.alquilerautorara.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Classe que representa o usuario do sistema
 * 
 * @author hlandim
 *
 */
@Entity
public class UserInfo implements Serializable {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(unique = true)
	@NotEmpty
	@Size(max = 50)
	private String username;

	@Column
	@NotEmpty
	private String name;

	@Column
	@NotEmpty
	private String password;

	@DateTimeFormat(pattern = "dd/MM/yyyy")
	@Column
	@NotNull
	private LocalDate birthdate;
	
	@Column
	@NotEmpty
	@Email
	private String email;
	
	@Column
	@NotEmpty
	private String telefono;
	
	@Column
	@NotEmpty
	private String documento;
	
	@Column
	private String direccion;

	@Column
	@NotNull
	@Enumerated(EnumType.STRING)
	private Role role;
	
	@OneToMany(fetch = FetchType.EAGER,mappedBy="userInfo", cascade = CascadeType.REMOVE)
    private List<Reserva> reservas;

	public UserInfo() {
	}

	public LocalDate getBirthdate() {
		return birthdate;
	}

	public UserInfo(Long id, String username, String name, String password, LocalDate birthdate, String email,
			String telefono, String documento, String direccion, Role role, List<Reserva> reservas) {
		super();
		this.id = id;
		this.username = username;
		this.name = name;
		this.password = password;
		this.birthdate = birthdate;
		this.email = email;
		this.telefono = telefono;
		this.documento = documento;
		this.direccion = direccion;
		this.role = role;
		this.reservas = reservas;
	}

	public void setBirthdate(LocalDate birthdate) {
		this.birthdate = birthdate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public enum Role {
		ROLE_USER, ROLE_ADMIN;

	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getDocumento() {
		return documento;
	}

	public void setDocumento(String documento) {
		this.documento = documento;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public List<Reserva> getReservas() {
		return reservas;
	}

	public void setReservas(List<Reserva> reservas) {
		this.reservas = reservas;
	}
	
}
