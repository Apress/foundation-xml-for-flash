<%@ Page Language="VB" validateRequest="false"  ContentType="text/xml"%>
<%@ import Namespace="System" %>
<%@ import Namespace="System.IO" %>
<%@ import Namespace="System.XML" %>
<script runat="server">
    sub Page_Load(Source As Object, E As EventArgs)
        Dim xmlDocument As XmlDocument = New XmlDocument()
        Dim xmlResponse AS XMLDocument = New XmlDocument()
        Dim strReader as StringReader
        Dim strXML as String

        Dim sr as StreamReader = new StreamReader(Request.InputStream)
        Try
            xmlDocument.Load(sr)
            xmlDocument.Save(Server.Mappath("login.xml"))
            strXML = "The login.xml file has been saved."
        Catch ex as exception
            strXML = ex.toString
        End Try
        strReader = new StringReader("<message>" & strXML & "</message>")
        xmlResponse.Load(strReader)

        response.write (xmlResponse.OuterXML)
    end sub
</script>
