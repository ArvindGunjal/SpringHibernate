

<center><h2>Admin Panel</h2></center>

<div class="container">
 <table  class="table table-striped" > 
  <thead>
      <tr>
      
        <th>User ID</th>
        <th>User Email ID</th>
        <th>User Password</th>
        <th>User Profile Picture</th>
        <th>Delete</th>
       <th>Update</th>
      </tr>
    </thead>
    <tbody>

 	<c:forEach var="entry" items="${lists}">
  		<tr>
  			<td><c:out value="${entry.key}" /></td>
 			 <td><c:out value="${entry.value.get(0)}"/> </td>
 			<td><c:out value="${entry.value.get(1)}"/></td>
 			<td><img width="50" height="50" src="getProfile_Pic/<c:out value='${entry.key}'/>"></td>
 			 <td><a href="/springhibernate/deleteuser/${entry.key}"><span class="btn"><i class="fa fa-trash"></i></span></a> </td>
 			 <td> <span class="btn"><button class="update-button" data-toggle="modal" data-target="#myModal" ><span class="glyphicon glyphicon-pencil"></span></button></span></td>
  				<!-- Modal -->
			  <div class="modal fade" id="myModal" role="dialog">
			    <div class="modal-dialog">
			    
			      <!-- Modal content-->
			      <div class="modal-content">
			        <div class="modal-header">
			          <button type="button" class="close" data-dismiss="modal">&times;</button>
			          <h4 class="modal-title">Editing Panel</h4>
			        </div>
			        <div class="modal-body">
			         <div class="container">

						  <form method="post" action="/springhibernate/edit_user_details"  class="form-horizontal">
						
						 
     						
    						  <div class="col-sm-6">
    						    User ID:<input class="form-control" type="text" id="userID" name="id">
    						    User Email  <input class="form-control" type="text" id="userEmail" name="email">
    						    User Password  <input class="form-control" type="text" id="userPassword" name="password">
    						    <br>
    						    <button type="submit" class="btn btn-default" >Submit</button>
  					  	     </div>
   
						  
						    
						  </form>
					
			
			        </div>
			        <div class="modal-footer">
			          <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>
			        </div>
			      </div>
			      
			    </div>
			  </div>
				
  		</tr> 
  
  		
  	</c:forEach> 
  	
  	
  	</tbody>
  </table>
  
</div>
