<%
Set link = Server.CreateObject("ADODB.Connection")
link.Open ("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("db.mdb"))
set rs=server.CreateObject("adodb.recordset")
sql="select * from form"
rs.open sql,link,1,1
data=""
do while not rs.EOF
	data = data & "<item id=" & chr(34) & rs("id") & chr(34)
	data = data & " date=" & chr(34) & rs("date") & chr(34)
	data = data & " username=" & chr(34) & rs("name") & chr(34)
	data = data & " QQ=" & chr(34) & rs("QQ") & chr(34)
	data = data & " tel=" & chr(34) & rs("tel") & chr(34)
	data = data & " usercomment=" & chr(34) & rs("comment") & chr(34) & "/>"
	rs.MoveNext
loop
Response.ContentType = "text/XML"
Response.Write("<data>"& data & "</data>")
rs.Close
link.Close
%>