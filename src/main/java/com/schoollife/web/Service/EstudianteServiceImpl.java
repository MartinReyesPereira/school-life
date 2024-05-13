package com.schoollife.web.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.schoollife.web.Entities.Estudiante;
import com.schoollife.web.Entities.Programa_Integracion;
import com.schoollife.web.Repository.EstudianteRepository;
import com.schoollife.web.Repository.Programa_IntegracionRepository;

import jakarta.transaction.Transactional;

@Service
public class EstudianteServiceImpl implements EstudianteService{
	@Autowired
	private final EstudianteRepository estudianteR;
	@Autowired
	private final Programa_IntegracionRepository programaR;

	public EstudianteServiceImpl(EstudianteRepository estudianteR, Programa_IntegracionRepository programaR) {
		super();
		this.estudianteR = estudianteR;
		this.programaR = programaR;
	}

	@Override
	@Transactional
	public List<Estudiante> getAll() {
		return estudianteR.findAll();
	}

	@Override
	@Transactional
	public void updateEstudiante(Estudiante estudiante) {
		Optional<Estudiante> estudianteId = estudianteR.findById(estudiante.getRun_estudiante());
		Estudiante e = estudianteId.get();
		e.setAcepta_clases_religion(estudiante.isAcepta_clases_religion());
		e.setAlergias_alimentos(estudiante.getAlergias_alimentos());
		e.setAlergias_medicamentos(estudiante.getAlergias_medicamentos());
		e.setAmaterno(estudiante.getAmaterno());
		e.setApaterno(estudiante.getApaterno());
		e.setApto_educacion_fisica(estudiante.isApto_educacion_fisica());
		e.setBeca(estudiante.getBeca());
		e.setCantidad_computadores_casa(estudiante.getCantidad_computadores_casa());
		e.setCantidad_vacunas_covid(estudiante.getCantidad_vacunas_covid());
		e.setCelular(estudiante.getCelular());
		e.setColegio_procedencia(estudiante.getColegio_procedencia());
		e.setComuna(estudiante.getComuna());
		e.setConsultorio_clinica(estudiante.getConsultorio_clinica());
		e.setCorreo_electronico(estudiante.getCorreo_electronico());
		e.setCurso_id(estudiante.getCurso_id());
		e.setDireccion(estudiante.getDireccion());
		e.setEnfermedades_cronicas(estudiante.getEnfermedades_cronicas());
		e.setEsquema_completo_vacunacion_covid(estudiante.isEsquema_completo_vacunacion_covid());
		e.setEstablecimiento_id(estudiante.getEstablecimiento_id());
		e.setEstado(estudiante.isEstado());
		e.setEstatura(estudiante.getEstatura());
		e.setEtnia(estudiante.getEtnia());
		e.setFecha_matricula(estudiante.getFecha_matricula());
		e.setFecha_nacimiento(estudiante.getFecha_nacimiento());
		e.setFecha_ultima_vacuna_COVID(estudiante.getFecha_ultima_vacuna_COVID());
		e.setGenero(estudiante.getGenero());
		e.setGrupo_sanguineo(estudiante.getGrupo_sanguineo());
		e.setMedicamentos_contraindicados(estudiante.getMedicamentos_contraindicados());
		e.setNacionalidad(estudiante.getNacionalidad());
		e.setNombre(estudiante.getNombre());
		e.setNombre_contacto_emergencia(estudiante.getNombre_contacto_emergencia());
		e.setNumero_matricula(estudiante.getNumero_matricula());
		e.setObservaciones(estudiante.getObservaciones());
		e.setPais_nacimiento(estudiante.getPais_nacimiento());
		e.setPeso(estudiante.getPeso());
		e.setReligion(estudiante.getReligion());
		e.setRun_estudiante(estudiante.getRun_estudiante());
		e.setSeguro_escolar_privado(estudiante.getSeguro_escolar_privado());
		e.setSistema_prevision(estudiante.getSistema_prevision());
		e.setTelefono(estudiante.getTelefono());
		e.setTelefono_emergencia(estudiante.getTelefono_emergencia());
		e.setVacuna_covid(estudiante.isVacuna_covid());
		e.setVive_con(estudiante.getVive_con());
		estudianteR.save(e);
	}

	@Override
	@Transactional
	public Estudiante findEstudiante(Estudiante estudiante) {
		return estudianteR.findById(estudiante.getRun_estudiante()).orElse(null);
	}

	@Override
	@Transactional
	public Estudiante createEstudiante(Estudiante estudiante) {
		return estudianteR.save(estudiante);
	}

	@Override
	@Transactional
	public List<Object[]> findMatriculas() {
		return estudianteR.findMatriculas();
	}

	@Override
	@Transactional
	public List<Estudiante> findPorEstudiantePorCodigo(String query) {
		 if (query.isEmpty()) {
	            return estudianteR.findAll();
	        }
	        // Si hay una consulta proporcionada, realiza la búsqueda filtrando por nombre, apellido paterno o materno
	        String[] palabras = query.split("\s+"); // Divide la consulta en palabras separadas por espacio
	        return estudianteR.findAll().stream()
	                            .filter(estudiante -> {
	                                String nombreCompleto = estudiante.getNombre().toLowerCase() + " " +
	                                        estudiante.getApaterno().toLowerCase() + " " +
	                                        estudiante.getAmaterno().toLowerCase();
	                                for (String palabra : palabras) {
	                                    if (!nombreCompleto.contains(palabra.toLowerCase())) {
	                                        return false;
	                                    }
	                                }
	                                return true;
	                            })
	                            .collect(Collectors.toList());
	    }

	@Override
	@Transactional
	public List<Estudiante> findEstudiantePorCurso(Integer curso_id) {
		List<Estudiante> estudiantes = estudianteR.findAll();
		estudiantes = estudiantes.stream().filter(e-> e.getCurso_id() == curso_id).collect(Collectors.toList());
		return estudiantes;
	}

	@Override
	@Transactional
	public Integer totalMatriculados() {
		List<Estudiante> es = new ArrayList<Estudiante>(); 
		for (Estudiante e : estudianteR.findAll()) {
			if(e.isEstado()) {
				es.add(e);
			}
		}
		return es.size();
	}

	@Override
	@Transactional
	public Integer totalHombres() {
		List<Estudiante> es = new ArrayList<Estudiante>(); 
		for (Estudiante e : estudianteR.findAll()) {
			if(e.getGenero().equalsIgnoreCase("masculino")) {
				es.add(e);
			}
		}
		return es.size();
	}

	@Override
	@Transactional
	public Integer totalMujeres() {
		List<Estudiante> es = new ArrayList<Estudiante>(); 
		for (Estudiante e : estudianteR.findAll()) {
			if(e.getGenero().equalsIgnoreCase("femenino")) {
				es.add(e);
			}
		}
		return es.size();
	}

	@Override
	@Transactional
	public Integer totalOtro() {
		List<Estudiante> es = new ArrayList<Estudiante>(); 
		for (Estudiante e : estudianteR.findAll()) {
			if(e.getGenero().equalsIgnoreCase("otro")) {
				es.add(e);
			}
		}
		return es.size();
	}

	//Filtrar estudiantes por estado matriculado(true) o retirado(false)
	@Override
	@Transactional
	public List<Estudiante> findEstudiantePorEstado(String estado) {
		List<Estudiante> estudiantes = estudianteR.findAll();
		if(estado.equalsIgnoreCase("matriculado")) {
			estudiantes = estudiantes.stream().filter(e-> e.isEstado()).collect(Collectors.toList());
		}else {
			estudiantes = estudiantes.stream().filter(e-> !e.isEstado()).collect(Collectors.toList());
		}
			return estudiantes;
	}

	@Override
	public List<Estudiante> findEstudiantePorPie(String pie) {
		List<Estudiante> estudiantes = estudianteR.findAll();
		List<Programa_Integracion> programa = programaR.findAll();

		return estudiantes;
	}
}