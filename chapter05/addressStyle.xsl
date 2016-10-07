<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="xml" version="1.0" encoding="UTF-8" />
<xsl:template match="/">
  <finalPhoneBook>
	  <author>Sas Jacobs</author>
  <xsl:for-each select="/phoneBook/contact">
  <xsl:sort select="name" />
    <fullName><xsl:value-of select="name" /></fullName>
	<phone><xsl:value-of select="phone" /></phone>
  </xsl:for-each>
  </finalPhoneBook>
</xsl:template>
</xsl:stylesheet>