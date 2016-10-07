<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" indent="yes" />
	<xsl:template match="/">
		<categoryBooks>
			<xsl:for-each select="/dataroot/tblCategories">
			<xsl:sort select="category" />
				<category>
					<categoryName>
						<xsl:value-of select="category"/>
					</categoryName>
					<xsl:for-each select="tblDocuments">
					<xsl:sort select="documentName" />
						<book>
							<bookName>
								<xsl:value-of select="documentName"/>
							</bookName>
							<publishYear>
								<xsl:value-of select="documentPublishYear"/>
							</publishYear>
						</book>
					</xsl:for-each>
				</category>
			</xsl:for-each>
		</categoryBooks>
	</xsl:template>
</xsl:stylesheet>
