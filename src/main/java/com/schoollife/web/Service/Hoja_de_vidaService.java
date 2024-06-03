package com.schoollife.web.Service;

import java.util.List;

import com.schoollife.web.Entities.Hoja_de_vida;

public interface Hoja_de_vidaService {
	
	List<Hoja_de_vida> getByEstudianteId(String runEstudiante);
	Hoja_de_vida createHojaDeVida(Hoja_de_vida hoja);
	void deleteHojaDeVida(Integer id);

}
