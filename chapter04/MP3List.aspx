<%@ Page Language="vb" %>
<%@ import Namespace="System" %>
<%@ import Namespace="System.IO" %>
<%@ import Namespace="System.XML" %>
<script runat="server">

    Dim strDirectoryLocation as String = "c:\inetpub\wwwroot\mp3s"
    Dim dirs As String(), fileInfos as String()
    Dim i as Integer, j as Integer
    sub Page_Load
        Dim MP3Xml as XmlDocument = new XmlDocument()
        Dim folderElement as XMLElement
        Dim songElement as XMLElement

       'add XML declaration
        MP3Xml.AppendChild(MP3Xml.CreateXmlDeclaration("1.0", "UTF-8", _
        "no"))

       'root node
        Dim RootNode As XmlElement = MP3Xml.CreateElement("mp3s")
        MP3Xml.AppendChild(RootNode)

       'get folders
        if Directory.Exists(strDirectoryLocation) then
            dirs = Directory.GetDirectories(strDirectoryLocation)
            for i = 0 to Ubound(dirs)
                dirs(i) = replace(dirs(i), strDirectoryLocation, "")
            next
            Array.sort(dirs)
            for i=0 to Ubound(dirs)
                folderElement = MP3Xml.CreateElement("folder")
                folderElement.SetAttribute("foldername", _
                replace(dirs(i),"\",""))
                RootNode.AppendChild(folderElement)

                'get files
                fileInfos = Directory.GetFiles(strDirectoryLocation _
                & dirs(i) & "\", "*.mp3")
                for j = 0 to Ubound(fileInfos)
                    fileInfos(j) = replace(fileInfos(j), strDirectoryLocation _
                    & dirs(i) & "\", "")
                next
                Array.sort(fileInfos)
                for j = 0 to Ubound(fileInfos)
                    songElement = MP3xml.CreateElement("song")
                    songElement.SetAttribute("filename", fileInfos(j))
                    folderElement.AppendChild(songElement)
                next
            next
           End If

        'create XML content
        dim strContents as String = MP3Xml.outerXML
        response.write (strContents)
    end sub

</script>
