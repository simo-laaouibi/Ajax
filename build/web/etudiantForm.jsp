<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.Date"%>
<%@page import="ma.school.beans.Etudiant"%>
<%@page import="ma.school.service.EtudiantService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="script/script.js" type="text/javascript"></script>
        <script src="script/jsonExemple.js" type="text/javascript"></script>
        <link href="style/css1.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="template/header.jsp" %>
        <%@include file="template/menu.jsp" %>
        <%@include file="template/footer.jsp" %>

        <div class="content">
            <form method="GET" action="EtudiantController">
                <%
                    EtudiantService es = new EtudiantService();
                %>
                <fieldset>
                    <c:if test="${user!=null}">
                        <input name="userId" type="hidden" value="${user.id}" />
                    </c:if>
                    <c:if test="${user ==null}">
                        <legend>Informations Etudiant</legend>
                    </c:if>
                    <c:if test="${user!=null}">
                        <legend>Modification des informations  de l'id (${user.id})</legend>
                    </c:if>
                    <table border="0">
                        <tr>
                            <c:if test="${user!=null}">
                                <td>Nouveau Nom</td>
                                <td><input id="nom" type="text" name="nom" value="${onom}"  required=""/></td>
                                </c:if>
                                <c:if test="${user == null}">
                                <td>Nom</td>
                                <td><input id="nom" type="text" name="nom" value=""  required=""/></td>
                                </c:if>

                        </tr>
                        <tr>
                            <c:if test="${user!=null}">
                                <td>Nouveau Prenom</td>
                                <td><input id="prenom" type="text" name="prenom" value="${oprenom}" required="" /></td>
                                </c:if>
                                <c:if test="${user==null}">
                                <td>Prenom</td>
                                <td><input id="prenom" type="text" name="prenom" value="" required="" /></td>
                                </c:if>
                        </tr>
                        <tr>
                            <c:if test="${user!=null}">
                                <td>Nouvelle Ville</td>
                                <td><select id="ville" name="ville">
                                        <option value="Rabat">Rabat</option>
                                        <option value="Fes">Fes</option>
                                        <option value="Marakech">Marrakech</option>
                                        <td><input id="Ville" type="text" name="ville" value="" required="" /></td>

                                    </select></td>
                                </c:if>
                                <c:if test="${user ==null}">
                                <td>Ville</td>
                                <td><select id="ville" name="ville">
                                        <option value="Rabat">Rabat</option>
                                        <option value="Fes">Fes</option>
                                        <option value="Marakech">Marrakech</option>

                                    </select></td>
                                </c:if>
                        </tr>
                        <tr>
                            <c:if test="${user!=null}">
                                <td>Nouvelle Date de Naissance</td>
                                <td><input id="dateNaissance" type="date" name="dateNaissance" value="${odateNaissance}" required=""/></td>
                                </c:if>
                                <c:if test="${user==null}">
                                <td>Date de Naissance</td>
                                <td><input id="date" type="date" name="dateNaissance" value="" required="" /></td>

                            </c:if>
                        </tr>

                        <tr>
                            <td>Sexe</td>
                            <td>M<input id="m" type="radio" name="sexe" value="homme" />
                                F<input id="f" type="radio" name="sexe" value="femme" checked="checked" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <c:if test="${user==null}">
                                    <input name="op" type="submit" value="Envoyer" />
                                </c:if>
                                <c:if test="${user!=null}">
                                    <input name="op" type="submit" value="Modifier" />
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </fieldset>
            </form>
            <%
//                EtudiantService es = new EtudiantService();
            %>
            <fieldset>
                <legend>Liste des étudiants</legend>

                <table border="1" class="tab">
                    <thead>
                        <tr>
                            <th>Id</th>
                            <th>Nom <br>
                            <th>Prenom</th>
                            <th>Ville</th>
                            <th>Date de naissance</th>
                            <th>Sexe</th>
                            <th>Supprimer</th>
                            <th>Modifier</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%                            for (Etudiant e : es.findAll()) {
                        %>
                        <tr>
                            <td><%=e.getId()%></td>
                            <td><%=e.getNom()%></td>
                            <td><%=e.getPrenom()%></td>
                            <td><%=e.getVille()%></td>
                            <td><%=e.getDateNaissance()%></td>
                            <td><%=e.getSexe()%></td>
                            <td><a class="bndelete" href="javascript:void(0);" onclick="confirmDel('<%=e.getId()%>', '<%=e.getNom() + " " + e.getPrenom()%>','Etudiant')">Supprimer</a></td>
                            <td><a class="bnupdate" href="EtudiantController?op=update&id=<%=e.getId()%>">Modifier</a></td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>

            </fieldset>
        </div>
    </body>
</html>
