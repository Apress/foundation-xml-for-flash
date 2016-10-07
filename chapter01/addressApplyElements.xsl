<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="html" version="4.0"/>
<xsl:template match="/">
  <h1>Phone Book</h1>
  <xsl:apply-templates/> 
</xsl:template>
<xsl:template match="contact">
	<xsl:apply-templates select="name"/>
</xsl:template>
<xsl:template match="name">
Name: <xsl:value-of select="."/><br />
</xsl:template>
</xsl:stylesheet>