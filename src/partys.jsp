<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%@ page import="java.io.File" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%@ page import="java.text.SimpleDateFormat" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>GreenTea Cloud</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>  
</head>
<body>

<div class="container">
  <h2>Welcome GreenTea Cloud!</h2>
  <a href="logout.jsp">logout!!</a>

  <form action="deleteFolder.jsp" method="post">
  <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalMkdir">
    ���� ���� 
  </button>
<button type="button" class="btn btn-warning" data-toggle="modal" data-target="#modalUpload">
   ���ε�
  </button>

	  <table class="table table-hover table-bordered">
	    <thead class="bg-success">
	      <tr>
	      	<th>üũ</th>
	        <th>����</th>
	        <th>������¥</th>
	        <th>����ũ��</th>
	      </tr>
	    </thead>
	    <tbody>
	      <%
	      	request.setCharacterEncoding("utf-8");
	      	String ndir = request.getParameter("_nextDir");
	      	String bdir = request.getParameter("_backDir");
	      	System.out.println("ndir url�� : "+ndir);

	      	if(bdir == null){
	      		bdir = "";
	      	}
	      	
	      	String dirRoot = (String)session.getAttribute("__rootDir");
	      	String dirCurent = (String)session.getAttribute("__curentDir");
	      	String dirName = "";
	      	System.out.println("dirRoot �� : "+dirRoot);
	      	System.out.println("dirCurent �� : "+dirCurent);
	      	
	      	
	      	if(dirRoot.length() >= dirCurent.length()){
	      		session.setAttribute("__curentDir", dirRoot);
	      	}
	      	
	      	if(session.getAttribute("__curentDir") == null){ //Ȥ�ö� __curentDir�� ���� ���
	      		session.setAttribute("__curentDir", dirRoot); //��� ������ �� �϶� ��Ʈ��η� ���� 
	      		
	      	} else if(bdir.equals("back")) { //���� ���丮 ���ٽ�
	      		String strTemp = ((String)session.getAttribute("__curentDir"));
	      		String[] splitTemp = strTemp.split("/");
	      		//System.out.println("���ø� �迭 ũ��"+strTemp.length());
	      		for(String s : splitTemp){
	      			System.out.println("���ø� ���"+s);
	      		}
	      		//System.out.println(strTemp.length()-(splitTemp[splitTemp.length-1].length()));
	      		dirName = strTemp.substring(0, strTemp.length()-(splitTemp[splitTemp.length-1].length())-1);
	      		session.setAttribute("__curentDir", dirName); //��μ����� �ֱ�����
	      		
	      	} else { //���� ���丮 ���ٽ�
	      		if(ndir == null){
	      			dirName = (String)session.getAttribute("__curentDir");
	      		} else{
	      			
	      			dirName = (String)session.getAttribute("__curentDir")+"/" + ndir;	
	      		}
	      		
	      		session.setAttribute("__curentDir", dirName); //��μ����� �ֱ�����
	      		
	      	}
	      	//out.print(bdir+"<br>");
	      	//out.print(ndir+"<br>");
	      	//out.print("dirName : "+dirName+"<br>");
	      	//out.print("dirCurent : "+dirCurent+"<br>");
	      	//out.print("dirRoot : "+dirRoot+"<br>");
	      	//System.out.println("bdir : "+bdir);
	      	//System.out.println("ndir : "+ndir);
	      	
	      	System.out.println("dirName : "+dirName);
	  		
	  		if(!dirRoot.equals(dirName)){ //���� ���丮�� ���� *
	  			out.print("<td>.. /</td>");
	  			out.print("<td><a href=partys.jsp?_backDir=back&_nextDir="+ndir+" style=\"color: green\">���� ���͸�</a></td>");
	  	 		out.print("<td></td>");
	  	 		out.print("<td></td>");
	  		}
	  		
	  		File dir = new File(dirName);
	  		File[] files = dir.listFiles();
	  		//File files[] = DirList.getFileInfo();
	  		try{
	  			for(File f: files){ //���丮 �� ���
		  		    String str = f.getName();
	  				String abPath = f.getAbsolutePath();
	  				//System.out.println("���� ���" + abPath);
	  				//System.out.println("���͸� �̸�" + str);
		  		  	out.print("<tr>");
		  	 	   if(f.isDirectory()){ //���͸� �϶� ���
		  	 		out.print("<td><input type=radio name=_radio value="+URLEncoder.encode(abPath, "UTF-8")+"></td>");		  	 		   
					out.print("<td><a href=partys.jsp?_nextDir="+URLEncoder.encode(str)+" style=\"color: green\">" + str + "</a></td>");
		  	 		   //out.print("<td><a href=partys.jsp?_nextDir="+str+">" + str + "</a></td>");
		  	 		   out.print("<td></td>");
		  	 		   out.print("<td></td>");
		  	 	   }else{ //������ ��� ... txt���ϸ� ���.
		  		    	//if(str.endsWith(".txt")){
					long lastModified = f.lastModified();

					String pattern = "yyyy-MM-dd hh:mm";
					SimpleDateFormat sdf = new SimpleDateFormat(pattern);

					Date lastModifiedDate = new Date(lastModified);
 
		  		    	out.print("<td><input type=radio name=_radio value="+URLEncoder.encode(abPath, "UTF-8")+"></td>");		  		    	
					out.print("<td><a href=download.jsp?fileName="+URLEncoder.encode(str)+">" + str + "</a></td>");
		  		    	out.print("<td>"+ sdf.format(lastModifiedDate) +"</td>");
					if(Math.round((double)f.length()/1024 * 10) / 10.0 < 1024) {
		  		    		out.print("<td>" + Math.round((double)f.length()/1024 * 10) / 10.0 + "KB</td>");
					} else if(Math.round((double)f.length()/1024 * 10) / 10.0 < 1024000 && Math.round((double)f.length()/1024 * 10) / 10.0 >= 1024) {
						out.print("<td>" + Math.round((double)f.length()/1024000 * 10) / 10.0 + "MB</td>");
					}
		  	  	   }
		  	 	out.print("</tr>");
				
		  		}//for-------
			out.print("<input type=submit class='btn btn-warning' value=�����ϱ�>");
	  		}catch(Exception e){
	  			//session.setAttribute("__rootDir", "C:\\Users");
	  			session.setAttribute("__curentDir", "/var/lib/tomcat9/webapps/ROOT/users_cloud");
	  			//out.println("<script>alert('���� �߻�!! ��Ʈ�� �̵��մϴ�.');</script>"); 
	  			response.sendRedirect("partys.jsp");
	  		}
	  		
	      
	      
	      %>
	    </tbody>
	  </table>
  </form>
  
<ul class="pagination justify-content-center">
  <li class="page-item disabled"><a class="page-link" href="#">����</a></li>
  <li class="page-item"><a class="page-link" href="#">1</a></li>
  <li class="page-item"><a class="page-link" href="#">2</a></li>
  <li class="page-item"><a class="page-link" href="#">3</a></li>
  <li class="page-item"><a class="page-link" href="#">����</a></li>
</ul>

<div class="container">
  <!-- The Modal -->
  <div class="modal" id="modalMkdir">
    <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h1 class="modal-title">�� ���� ����</h1>
          <button type="button" class="close" data-dismiss="modal">��</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="container" id="join_form">
		
		<form action="mkdir.jsp" method="post" accept-charset="UTF-8" >
			
			<h5>������</h5>
			<input class="form-control" type="text" name="_dir" maxlength="20"onkeydown="inputIdChk()" placeholder="dir name" required autofocus"> 
			
			<button id="login_btn" class="btn btn-lg btn-info btn-block" type="submit">�����ϱ�</button>
		</form>
	</div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div><!-- modal container -->

  <!-- The Modal -->
  <div class="modal" id="modalUpload">
    <div class="modal-dialog modal-dialog-scrollable">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h1 class="modal-title">���� ���ε�</h1>
          <button type="button" class="close" data-dismiss="modal">��</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body">
          <div class="container" id="join_form">
			<h5>���ϸ�</h5>
			<form action="upload.jsp" method="post" enctype="multipart/form-data"  accept-charset="UTF-8" >
			<div class="custom-file mb-3">
      			<input type="file" class="custom-file-input" id="customFile" name="filename">
      			<label class="custom-file-label" for="customFile">Choose file</label>
      			<button id="login_btn" class="btn btn-lg btn-info btn-block" type="submit">���ε� �ϱ�</button>
    		</div>
    		</form>
    		<script>
			// Add the following code if you want the name of the file appear on select
			$(".custom-file-input").on("change", function() {
			  var fileName = $(this).val().split("\\\\").pop();
			  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
			});
			</script>
	</div>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
        </div>
        
      </div>
    </div>
  </div>
  
</div><!-- modal container -->
  
</div>

</body>
</html>