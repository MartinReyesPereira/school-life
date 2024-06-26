package com.schoollife.web.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.schoollife.web.Entities.Curso;
import com.schoollife.web.Entities.Usuario;
import com.schoollife.web.Service.CursoService;
import com.schoollife.web.Service.EstablecimientoService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class CursoController {
	
	@Autowired
	private final CursoService cursoS;
	@Autowired
	private final EstablecimientoService establecimientoS;
	
	public CursoController(CursoService cursoS, EstablecimientoService establecimientoS) {
		super();
		this.cursoS = cursoS;
		this.establecimientoS = establecimientoS;
	}

	
	@GetMapping("/curso")
	public String indexCurso(Model model,HttpSession sesion) {
		if(sesion.getAttribute("user") != null) {
			
			List<Usuario> uSesion =  (List<Usuario>) sesion.getAttribute("user");
			model.addAttribute("uSesion",uSesion.get(0));
			model.addAttribute("establecimientoSesion", establecimientoS.findById(uSesion.get(0).getEstablecimientoId()));		
			
			var c = cursoS.getAll(uSesion.get(0).getEstablecimientoId());
			var e = establecimientoS.getAll();
			model.addAttribute("cursos",c);
			model.addAttribute("establecimientos",e);
			model.addAttribute("user",sesion.getAttribute("user"));
			return "Curso";
		}
		return "Login";
	}
	
	@GetMapping("/curso/ingresar")
	public String cursoAgregar(Curso curso,Model model,HttpSession sesion)
	{
		if(sesion.getAttribute("user") != null) {
			
			List<Usuario> uSesion =  (List<Usuario>) sesion.getAttribute("user");
			model.addAttribute("uSesion",uSesion.get(0));
			model.addAttribute("establecimientoSesion", establecimientoS.findById(uSesion.get(0).getEstablecimientoId()));
			var establecimientos = establecimientoS.getAll();
			model.addAttribute("establecimientos", establecimientos);
			model.addAttribute("curso",curso);
			
			var letras = cursoS.abecedario();
			model.addAttribute("letras",letras);
			
			model.addAttribute("user",sesion.getAttribute("user"));
			return "Curso-ingresar"; 
		}
		return "Login";
	}
	
	@PostMapping(path = "/curso/ingresado", consumes = "application/x-www-form-urlencoded")
	public String cursoIngresado(@Valid Curso curso,Errors errores,RedirectAttributes flash,Model model, HttpSession sesion)
	{
		if(sesion.getAttribute("user") != null) {
			
			model.addAttribute("user",sesion.getAttribute("user"));
			List<Usuario> uSesion =  (List<Usuario>) sesion.getAttribute("user");
			model.addAttribute("uSesion",uSesion.get(0));
			model.addAttribute("establecimientoSesion", establecimientoS.findById(uSesion.get(0).getEstablecimientoId()));	
			var letras = cursoS.abecedario();
			model.addAttribute("letras",letras);
			var establecimientos = establecimientoS.getAll();
			model.addAttribute("establecimientos", establecimientos);
			Curso c = new Curso();
			c.setApodo(curso.getApodo());
			c.setCapacidad(curso.getCapacidad());
			c.setEstablecimiento_id(uSesion.get(0).getEstablecimientoId());
			c.setId_curso(curso.getId_curso());
			c.setJornada(curso.getJornada());
			c.setLetra(curso.getLetra());
			c.setLocal(curso.getLocal());
			c.setNivel(curso.getNivel());
			c.setNivel_ensenanza(curso.getNivel_ensenanza());
			c.setNumero_sala(curso.getNumero_sala());
			
			if (errores.hasErrors()) {
				return "Curso-ingresar";
			}	
			cursoS.CreateCurso(c);
			flash.addFlashAttribute("success","Curso ingresado correctamente");
			model.addAttribute("curso",c);
			model.addAttribute("usuario", sesion.getAttribute("usuario"));
			return "redirect:/curso"; 
			
		}
		return "Login";
	}
	
	@GetMapping("/curso/modificar/{id_curso}")
	public String cursoModificar(Curso curso,Model model,HttpSession sesion) {
		if(sesion.getAttribute("user") != null) {
			
			model.addAttribute("user",sesion.getAttribute("user"));
			List<Usuario> uSesion =  (List<Usuario>) sesion.getAttribute("user");
			model.addAttribute("uSesion",uSesion.get(0));
			model.addAttribute("establecimientoSesion", establecimientoS.findById(uSesion.get(0).getEstablecimientoId()));	
			
			var letras = cursoS.abecedario();
			model.addAttribute("letras",letras);
			curso = cursoS.findCurso(curso);
			var e = establecimientoS.getAll();
			model.addAttribute("curso",curso);
			model.addAttribute("establecimientos",e);
			return "Curso-modificar";
		}
		return "Login";
	}
	
	@PostMapping(path = "/curso/modificado", consumes = "application/x-www-form-urlencoded")
	public String cursoModificada(@Valid Curso curso,Errors errores,RedirectAttributes flash,Model model,HttpSession sesion) {
		if(sesion.getAttribute("user") != null) {
			
			model.addAttribute("user",sesion.getAttribute("user"));
			List<Usuario> uSesion =  (List<Usuario>) sesion.getAttribute("user");
			model.addAttribute("uSesion",uSesion.get(0));
			model.addAttribute("establecimientoSesion", establecimientoS.findById(uSesion.get(0).getEstablecimientoId()));	
			
			var letras = cursoS.abecedario();
			model.addAttribute("letras",letras);
			var e = establecimientoS.getAll();
			model.addAttribute("establecimientos",e);
			var cursos = cursoS.getAll(uSesion.get(0).getEstablecimientoId());
			Curso c = new Curso();
			for (Curso cu : cursos) {
				if(cu.getId_curso() == curso.getId_curso()) {
					c.setApodo(cu.getApodo());
					c.setCapacidad(cu.getCapacidad());
					c.setEstablecimiento_id(uSesion.get(0).getEstablecimientoId());
					c.setId_curso(cu.getId_curso());
					c.setJornada(cu.getJornada());
					c.setLetra(cu.getLetra());
					c.setLocal(cu.getLocal());
					c.setNivel(cu.getNivel());
					c.setNivel_ensenanza(cu.getNivel_ensenanza());
					c.setNumero_sala(cu.getNumero_sala());
				}
			}		
			if (errores.hasErrors()) {
				return "Curso-modificar";
			}			
			cursoS.updateCurso(curso, curso.getId_curso());
			flash.addFlashAttribute("success","Curso modificado correctamente");
			model.addAttribute("curso",curso);	
			return "redirect:/curso";
		}
		return "Login";	
	}
	
	

}
