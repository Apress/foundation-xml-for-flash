<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <body>
  <h1>Phone Book</h1>
  <ul>
  <xsl:for-each select="/phoneBook/contact">
    <li><xsl:value-of select="name" /></li>
  </xsl:for-each>
  </ul>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>