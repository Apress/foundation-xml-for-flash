<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:template match="/document">
		<fo:root>
			<fo:layout-master-set>
				<fo:simple-page-master master-name="basePage" margin="1in">
					<fo:region-body margin="1in"/>
				</fo:simple-page-master>
			</fo:layout-master-set>
			<fo:page-sequence master-reference="basePage">
				<fo:flow flow-name="xsl-region-body">
					<fo:block font-color="blue" font-size="16pt" font-family="verdana">
						<xsl:value-of select="heading" />
					</fo:block>
					<fo:block font-color="black" font-size="12pt" font-family="verdana">
						<xsl:value-of select="text" />
					</fo:block>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>