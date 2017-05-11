<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="OpenReport.aspx.vb" Inherits="Reports.OpenReport" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
	<HEAD>
		<title>OpenReport</title>
		<meta name="GENERATOR" content="Microsoft Visual Studio .NET 7.1">
		<meta name="CODE_LANGUAGE" content="Visual Basic .NET 7.1">
		<meta name="vs_defaultClientScript" content="JavaScript">
		<meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5">
	</HEAD>
<SCRIPT LANGUAGE="javascript">
var divCount = 20, nStatusCellIndex = 0;
function ChangeStatusColor(idx) {
 if (idx / divCount < 1) {
   document.getElementById("tbl").rows[0].cells[idx].bgColor = "#BF5BC4";
   nStatusCellIndex++;
 }
 else {
  for (var j=0; j<divCount; j++) 
   document.getElementById("tbl").rows[0].cells[j].bgColor="silver";nStatusCellIndex = 0;
 }
}
function Start(){
    timerID = setInterval("ChangeStatusColor(nStatusCellIndex)", 100);
}
</SCRIPT>
	<body MS_POSITIONING="GridLayout" bgcolor="#FFFAE8">	
	  <center>
				<table height="80%" valign="center" ID="Prss">
					<tr><td><table width="100%" ID="Table2">
								<tr><td align="center">資料處理中 ...</td></tr>
							</table>
							<table id="tbl" width="100%" cellpadding="1" cellspacing="1">
								<tr>
									<script language="javascript">
                                     for (var k = 0; k< divCount; k++) 
                                        document.write("<td bgColor='silver' width=8><br></td>\n");
									</script>
								</tr>
							</table>
						</td></tr>
				 </table>
		</center>		
		<form id="Form1" method="post" name='Form1'>
		    <% 
                         dim HtmlStr as String
                         dim x as String
                          For Each x In Request.QueryString
                            if StrComp(x,"_src",1)<>0 then
                             HtmlStr=HtmlStr & "<input type='HIDDEN' name='" & x & "' value='" & Request.QueryString(x) & "'>"
                            end if 
                          Next
                          For Each x In Request.Form
                           if StrComp(x,"_src",1)<>0 then
                             HtmlStr=HtmlStr & "<input type='HIDDEN' name='" & x & "' value='" & Request.Form(x) & "'>"
                           end if 
                          Next
                          response.write(HtmlStr)
            %>            			
		</form>
		<SCRIPT LANGUAGE="javascript">
		if(top==self)
		{ self.moveTo(0,0); 
		  self.resizeTo(screen.availWidth,screen.availHeight); 
		}
		<% if Request("_src") &""<>"" then 
		    response.write("Start();")
		    if Request.QueryString.Count=0 then
		     response.write("document.Form1.method=""POST"";")
		    else
		     response.write("document.Form1.method=""GET"";")
		    end if 
		    response.write("document.Form1.action=""" & Request("_src") & """;")		    
		    response.write("document.Form1.submit();")		   		    
		   end if 
		%>
		</SCRIPT>
	</body>	
</HTML>
