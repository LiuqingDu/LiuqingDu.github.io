<%
Set link = Server.CreateObject("ADODB.Connection")
link.Open ("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("db.mdb"))
set rs=server.CreateObject("adodb.recordset")
sql="select* from form"
rs.open sql,link,1,3
rs.addnew
rs("date")=now()
rs("name")=Request("username")
rs("QQ")=Request("QQ")
rs("tel")=Request("tel")
rs("comment")=Request("usercomment")
rs.update
rs.Close
link.Close
Response.Write("&success=1")
%>