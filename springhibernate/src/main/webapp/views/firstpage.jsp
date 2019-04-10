

<%
      	
        HttpSession sess = request.getSession(false);
		try{
			  String check = sess.getAttribute("username").toString();
		        
		        if (check == "" || check == null) {
		            System.out.println("Invalid Entry");
		            sess.invalidate();
		            response.sendRedirect("/views/welcomepage.jsp");
		        }
		}
		catch(Exception ex)
		{
			response.sendRedirect("welcomepage.jsp");
		}
      

 %>




 <%@ include file="navigationbar.jsp" %>
  <c:choose>
    <c:when test="${message.equals('true1')}">
		<%@ include file="adminpage.jsp" %>	
    </c:when>

</c:choose>


<div id="section1" class="container-fluid bg-secondary" style="padding-top:2px;padding-bottom:30px">
  <h4>Section 1</h4>
 	<%@ include file="sectionone.jsp" %>	
 	
</div>
<div id="section2" class="container-fluid bg-warning" style="padding-top:10px;padding-bottom:70px">
  <h1>Section 2</h1>
 <p>Add Content</p>
</div>
<div id="section3" class="container-fluid bg-secondary" style="padding-top:10px;padding-bottom:70px">
  <h1>Section 3</h1>
 <p>Add Content</p>
</div>
<div id="section4" class="container-fluid bg-danger" style="padding-top:10px;padding-bottom:70px">
  <h1>Section 4 </h1>
 <p>Add Content</p>
</div>
<div id="section5" class="container-fluid bg-success" style="padding-top:10px;padding-bottom:70px">
  <h1>Section 5 </h1>
 <p>Add Content</p>
</div>


${UserMessage}	
${id}

</body>
</html>