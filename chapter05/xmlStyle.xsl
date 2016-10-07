<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <nameList>
   <xsl:for-each select="/phoneBook/contact">
    <nameEntry><xsl:value-of select="name" /></nameEntry>
  </xsl:for-each>
  </nameList>
</xsl:template>
</xsl:stylesheet>