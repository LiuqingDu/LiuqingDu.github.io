<%
Set link = Server.CreateObject("ADODB.Connection")
link.Open ("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("db.mdb"))
set rs=server.CreateObject("adodb.recordset")
sql="select * from form"
rs.open sql,link,1,1
data=""
do while not rs.EOF
	data = data & "<item id=" & chr(34) & rs("id") & chr(34) & " date=" & chr(34) & rs("date") & chr(34) & " user=" & chr(34) & rs("user") & chr(34) & " QQ=" & chr(34) & rs("QQ") & chr(34) & " comment=" & chr(34) & rs("comment") & chr(34) & "/>"
	rs.MoveNext
loop
Response.ContentType = "text/XML"
Response.Write("<data>"& data & "</data>")
rs.Close
link.Close
%>