<%@ Page Language="VB" validaterequest="false" ContentType="text/xml" %>
<%@ import Namespace="System" %>
<%@ import Namespace="System.IO" %>
<%@ import Namespace="System.XML" %>
<script runat="server">
    sub Page_Load(Source As Object, E As EventArgs)
        Dim xmlDocument As XmlDocument = New XmlDocument()
        Dim sr as StreamReader = new StreamReader(Request.InputStream)
        xmlDocument.Load(sr)
        response.write (xmlDocument.outerXML)
    end sub

</script>
