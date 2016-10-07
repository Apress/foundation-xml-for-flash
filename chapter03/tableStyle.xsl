<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:template match="/">
  <html>
  <head>
  	<title>Phone Book</title>
	<link href="tablestyles.css" type="text/css" rel="stylesheet" />
  </head>
  <body>
  <h1>Phone Book</h1>
  <table>
  <tr>
  <th>Name</th>
  <th>Address</th>
  <th>Phone</th>
  </tr>
  <xsl:for-each select="/phoneBook/contact">
  <xsl:sort select="name" />
    <tr>
	<td><xsl:value-of select="name" /></td>
	<td class="shading"><xsl:value-of select="address" /></td>
	<td><xsl:value-of select="phone" /></td>
	</tr>
  </xsl:for-each>
  </table>
  </body>
  </html>
</xsl:template>
</xsl:stylesheet>