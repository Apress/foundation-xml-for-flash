<%@ Page Language="VB" Debug="true" %>
<%@ import Namespace="System.XML" %>
<script runat="server">
    sub Page_Load
        dim strContents as String
        Dim myXmlDocument as XmlDocument = new XmlDocument()
        dim strURL as String = "http://p.moreover.com/cgi-local/page?c=Web%20developer%20news&o=xml"
        myXmlDocument.Load (strURL)
        strContents = myXmlDocument.OuterXML
        response.write (strContents)
    end sub
</script>
