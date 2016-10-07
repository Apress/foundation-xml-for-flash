<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0"/>
	<xsl:template match="/">
		<dataroot xmlns:od="urn:schemas-microsoft-com:officedata" generated="2005-06-03T06:00:01">
			<xsl:for-each select="/allBooks/book">
				<tblDocuments>
					<documentID>
						<xsl:value-of select="@id"/>
					</documentID>
					<documentName>
						<xsl:value-of select="@name"/>					
					</documentName>
					<authorID>
						<xsl:value-of select="@authorID"/>
					</authorID>
					<documentPublishYear>
						<xsl:value-of select="@publishYear"/>
					</documentPublishYear>
					<categoryID>
						<xsl:value-of select="@categoryID"/>
					</categoryID>
				</tblDocuments>
			</xsl:for-each>
		</dataroot>
	</xsl:template>
</xsl:stylesheet>
