<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">

	<xsl:output method="html"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<meta charset="UTF-8"/>
			</head>
			<body>
				<xsl:apply-templates select="Modul"/>
			</body>
		</html>
	</xsl:template>
	
	<xsl:template match="Modul">
				<table border="1" class="attribute-table">
					<tr>
						<td>Megnevezés</td>
						<td>Kód</td>
						<td>Név</td>
						<td>Leírás</td>
					</tr>
							<tr>
			<td>
				<xsl:value-of select="Megnevezes"/>
			</td>
			<td>
				<xsl:value-of select="Kod"/>
			</td>
			<td>
				<xsl:value-of select="Nev"/>
			</td>
			<td>
				<xsl:value-of select="Leiras"/>
			</td>
		</tr>
				</table>
	</xsl:template>
	
	
</xsl:stylesheet>