package com.schoollife.classbook.Entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "registro_asignatura")
public class Registro_asignatura {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	@Column(name = "id_profesor")
	private Integer id_profesor;
	@Column(name = "id_estudiante")
	private Integer id_estudiante;
	@Column(name = "id_curso")
	private Integer id_curso;
	@Column(name = "id_asignatura")
	private Integer id_asignatura;
	@Column(name = "descripcion")
	private String descripcion;
	public Registro_asignatura(Integer id, Integer id_profesor, Integer id_estudiante, Integer id_curso,
			Integer id_asignatura, String descripcion) {
		super();
		this.id = id;
		this.id_profesor = id_profesor;
		this.id_estudiante = id_estudiante;
		this.id_curso = id_curso;
		this.id_asignatura = id_asignatura;
		this.descripcion = descripcion;
	}
	public Registro_asignatura() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getId_profesor() {
		return id_profesor;
	}
	public void setId_profesor(Integer id_profesor) {
		this.id_profesor = id_profesor;
	}
	public Integer getId_estudiante() {
		return id_estudiante;
	}
	public void setId_estudiante(Integer id_estudiante) {
		this.id_estudiante = id_estudiante;
	}
	public Integer getId_curso() {
		return id_curso;
	}
	public void setId_curso(Integer id_curso) {
		this.id_curso = id_curso;
	}
	public Integer getId_asignatura() {
		return id_asignatura;
	}
	public void setId_asignatura(Integer id_asignatura) {
		this.id_asignatura = id_asignatura;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	@Override
	public String toString() {
		return "Registro_asignatura [id=" + id + ", id_profesor=" + id_profesor + ", id_estudiante=" + id_estudiante
				+ ", id_curso=" + id_curso + ", id_asignatura=" + id_asignatura + ", descripcion=" + descripcion + "]";
	}
	
	
	
	

}
