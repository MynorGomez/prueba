<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Evita ejecutar este bloque m�s de una vez por petici�n
    if (request.getAttribute("jwtFilterExecuted") == null) {
        request.setAttribute("jwtFilterExecuted", true);

        // ?? Verificar sesi�n (usa la variable impl�cita 'session')
        if (session == null || session.getAttribute("jwt") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
        }

        // ?? Obtener usuario logueado
        Object usuarioObj = session.getAttribute("usuario");
        String usuarioLog = (usuarioObj != null) ? usuarioObj.toString() : "Invitado";
        request.setAttribute("usuarioLog", usuarioLog);

        // ?? Obtener nombre completo desde sesi�n
        Object nombreObj = session.getAttribute("nombre");
        String nombreLog = (nombreObj != null) ? nombreObj.toString() : "Invitado";
        request.setAttribute("nombreLog", nombreLog);
    }
%>
