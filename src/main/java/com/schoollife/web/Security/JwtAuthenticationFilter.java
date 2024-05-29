package com.schoollife.web.Security;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
//la funcion de la clase es validar la informacion del token y si esto es existoso, establecera la autenticación de un usuario en la solicitud que se realiza
public class JwtAuthenticationFilter extends OncePerRequestFilter{

	
	@Autowired
	private CustomUsuarioDetailsService customUsuarioDetailsService;
	@Autowired
	private JwtGenerador jwtGenerador; 
	
	private String obtenerTokenSolicitud(HttpServletRequest request) {
			String bearerToken =  request.getHeader("Authorization");
		if(StringUtils.hasText(bearerToken) && bearerToken.startsWith("Bearer")) {
			return bearerToken.substring(7,bearerToken.length());
		}
		return null;
	}
		
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String token = obtenerTokenSolicitud(request);
		if(StringUtils.hasText(token) && jwtGenerador.validarToken(token)) {
			String username = jwtGenerador.obtenerUsernameDeJwt(token);
			UserDetails userDetails = customUsuarioDetailsService.loadUserByUsername(username);
			List<String> userRoles = userDetails.getAuthorities().stream().map(GrantedAuthority::getAuthority).toList();
			if(userRoles.contains("ADMIN") || userRoles.contains("USER")) {
				UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(userDetails, userDetails.getAuthorities());
				authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
				SecurityContextHolder.getContext().setAuthentication(authenticationToken);
			}
		}
		filterChain.doFilter(request, response);	
	}

}