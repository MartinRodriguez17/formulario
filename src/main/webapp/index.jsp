<%--
  Created by IntelliJ IDEA.
  User: Martin Rodrigeuz
  Date: 12/05/2025
  Time: 08:32 p.m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.Map" %>
<%
    // Obtenemos el mapa de errores enviado por el Servlet (si existe)
    Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
%>

<html lang="en">
<head>
    <!-- Enlazamos Bootstrap desde la carpeta local /css -->
    <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet"/>

    <!-- Título de la pestaña del navegador -->
    <title>Formulario usuario</title>

    <!-- Estilos CSS internos, idealmente deberías pasarlos a estilos.css -->
    <style>
        /* Estilo de fondo general */
        body {
            background-color: black;
        }

        /* Título del formulario */
        h3 {
            color: #f8f9fa;
            text-align: center;
            margin-bottom: 25px;
            font-weight: bold;
        }

        /* Contenedor del formulario */
        form {
            background-color: #ced4da;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(111, 66, 193, 0.1);
            max-width: 600px;
            margin: 0 auto;
        }

        /* Campos de entrada */
        input[type="text"],
        input[type="password"],
        select {
            border: 1px solid #ced4da;
            border-radius: 5px;
            padding: 8px 12px;
            width: 100%;
            margin-bottom: 10px;
            background-color: beige;
        }

        /* Botón de envío */
        input[type="submit"] {
            background-color: chartreuse;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            width: 100%;
            margin-top: 15px;
        }

        input[type="submit"]:hover {
            background-color: navy;
        }

        /* Separador entre secciones */
        .form-section {
            margin-bottom: 20px;
            padding-bottom: 15px;
            border-bottom: 1px solid #eee;
        }

        .form-section:last-child {
            border-bottom: none;
        }

        /* Mensajes de error */
        .error-message {
            color: #dc3545 !important;
            font-size: 0.875em;
            margin-top: -8px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>

<!-- Contenedor principal -->
<div style="padding: 20px;">
    <h3>Formulario de Usuario</h3>

    <div>
        <!-- Formulario que envía al servlet de registro -->
        <form action="/formulario/registro" method="post">

            <!-- Campo: Usuario -->
            <div class="form-section">
                <label for="username">Usuario:</label>
                <div><input type="text" name="username" id="username"></div>
                <div>
                    <% if(errores != null && errores.containsKey("username")) { %>
                    <div class="error-message"><%= errores.get("username") %></div>
                    <% } %>
                </div>
            </div>

            <!-- Campo: Contraseña -->
            <div class="form-section">
                <label for="password">Password</label>
                <div><input type="password" name="password" id="password"></div>
                <div>
                    <% if(errores != null && errores.containsKey("password")) { %>
                    <div class="error-message"><%= errores.get("password") %></div>
                    <% } %>
                </div>
            </div>

            <!-- Campo: Email -->
            <div class="form-section">
                <label for="email">Email</label>
                <div><input type="text" name="email" id="email"></div>
                <div>
                    <% if(errores != null && errores.containsKey("email")) { %>
                    <div class="error-message"><%= errores.get("email") %></div>
                    <% } %>
                </div>
            </div>

            <!-- Campo: País -->
            <div class="form-section">
                <label for="pais">País</label>
                <div>
                    <select name="pais" id="pais">
                        <option value="">-----Seleccionar-----</option>
                        <option value="ES">España</option>
                        <option value="EC">Ecuador</option>
                        <option value="PE">Perú</option>
                        <option value="CO">Colombia</option>
                        <option value="BR">Brazil</option>
                        <option value="AR">Argentina</option>
                        <option value="VE">Venezuela</option>
                    </select>
                </div>
                <div>
                    <% if(errores != null && errores.containsKey("pais")) { %>
                    <div class="error-message"><%= errores.get("pais") %></div>
                    <% } %>
                </div>
            </div>

            <!-- Campo: Lenguajes -->
            <div class="form-section">
                <label for="lenguajes">Lenguajes</label>
                <div>
                    <select name="lenguajes" id="lenguajes">
                        <option value="">-----Seleccionar-----</option>
                        <option value="Java">Java</option>
                        <option value="Python">Python</option>
                        <option value="C#">C#</option>
                        <option value="C++">C++</option>
                        <option value="Angular">Angular</option>
                    </select>
                </div>
                <div>
                    <% if(errores != null && errores.containsKey("lenguajes")) { %>
                    <div class="error-message"><%= errores.get("lenguajes") %></div>
                    <% } %>
                </div>
            </div>

            <!-- Campo: Roles (checkboxes) -->
            <div class="form-section">
                <label>Roles</label>
                <div><input type="checkbox" name="roles" value="ROLE_ADMIN" id="role_admin">
                    <label for="role_admin">Administrador</label>
                </div>
                <div><input type="checkbox" name="roles" value="ROLE_USER" id="role_user">
                    <label for="role_user">Usuario</label>
                </div>
                <div><input type="checkbox" name="roles" value="ROLE_MODERADOR" id="role_mod">
                    <label for="role_mod">Moderador</label>
                </div>
                <% if(errores != null && errores.containsKey("roles")) { %>
                <div class="error-message"><%= errores.get("roles") %></div>
                <% } %>
            </div>

            <!-- Campo: Idioma (radios) -->
            <div class="form-section">
                <label>Idiomas</label>
                <div><input type="radio" name="idioma" value="es" id="idioma_es">
                    <label for="idioma_es">Español</label>
                </div>
                <div><input type="radio" name="idioma" value="en" id="idioma_en">
                    <label for="idioma_en">Inglés</label>
                </div>
                <div><input type="radio" name="idioma" value="ru" id="idioma_ru">
                    <label for="idioma_ru">Ruso</label>
                </div>
                <% if(errores != null && errores.containsKey("idioma")) { %>
                <div class="error-message"><%= errores.get("idioma") %></div>
                <% } %>
            </div>

            <!-- Campo: Habilitar (checkbox) -->
            <div class="form-section">
                <label for="habilitar">Habilitar</label>
                <div>
                    <input type="checkbox" name="habilitar" id="habilitar" checked>
                </div>
            </div>

            <!-- Botón de Enviar -->
            <div>
                <input type="submit" value="Enviar">
            </div>

            <!-- Campo oculto para datos internos -->
            <input type="hidden" name="secreto" value="123456">

        </form>
    </div>
</div>

</body>
</html>