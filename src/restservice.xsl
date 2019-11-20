<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns="http://www.w3.org/1999/xhtml">
	<xsl:output method="html"/>
	<xsl:template match="/">
		<html>
			<!--  -->
			<head>
				<meta charset="UTF-8"></meta>
				<link rel="stylesheet" href="./css/restservicedoc.css" type="text/css"></link>
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
				<link rel="stylesheet" href="./css/gruvbox-light.css"></link>
				<script src="./js/highlight.pack.js"></script>
				<script src="./js/beautify.js"></script>
				<script>hljs.initHighlightingOnLoad();</script>
			</head>
			<!--			-->
			<body>
				<xsl:apply-templates select="container"/>
				<script>$(document).ready(function() {$('code').each(function(){$(this).text(js_beautify($(this).text()));});$('code').each(function(i, block){hljs.highlightBlock(block);});});</script>
			</body>
		</html>
	</xsl:template>
	<xsl:template match="container">
		<p class="main-title">
			<xsl:value-of select="name"/>
		</p>
			<xsl:choose>
				<xsl:when test="count(./description) &gt; 0">
					<td class="attribute-value">
						<p><xsl:value-of select="description"/></p>
					</td>
				</xsl:when>
			</xsl:choose>

		<table border="1" class="attribute-table">
				<tr>
					<td colspan="2"  class="attribute-section-header">jellemző(k)</td>
				</tr>
				<tr>
					<td class="attribute-name">elem</td>
					<td class="attribute-value">meghatározás</td>
				</tr>
		

			<xsl:choose>
				<xsl:when test="count(./port) &gt; 0">
					<tr>
						<td class="attribute-name">PORT</td>
						<td class="attribute-value">
							<xsl:value-of select="port"/>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>

			<xsl:choose>
				<xsl:when test="count(./class) &gt; 0">
					<tr>
						<td class="attribute-name">reprezentáns osztály</td>
						<td class="attribute-value">
							<xsl:value-of select="class"/>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>

			<xsl:choose>
				<xsl:when test="count(./ecosystemMember) &gt; 0">
					<tr>
						<td class="attribute-name">elérés az ecosystem objektumon keresztül</td>
						<td class="attribute-value">
							<xsl:value-of select="ecosystemMember"/>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>

			<xsl:choose>
				<xsl:when test="count(./comment) &gt; 0">
					<tr>
						<td class="attribute-name">megjegyzés</td>
						<td class="attribute-value">
							<xsl:value-of select="comment"/>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>

		</table>

		<xsl:choose>
			<xsl:when test="count(./serviceList) &gt; 0">
				<p class="section-title">Szolgáltatás lista:</p>
				<xsl:apply-templates select="serviceList"/>
			</xsl:when>
		</xsl:choose>
		<xsl:choose>
			<xsl:when test="count(./classList) &gt; 0">
				<p class="section-title">Érintett osztályok:</p>
				<xsl:apply-templates select="classList"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="serviceList">
		<xsl:apply-templates select="service"/>
	</xsl:template>
	<xsl:template match="service">
		<p/>
		<table border="1" class="attribute-table">
			<tr>
				<td colspan="6" class="section-header">
					<xsl:value-of select="name"/>
				</td>
			</tr>
			<xsl:choose>
				<xsl:when test="count(./description) &gt; 0">
					<tr>
						<td class="attribute-name">leírás</td>
						<td colspan="4" class="attribute-value">
							<xsl:value-of select="description"/>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./requestDocument) &gt; 0">
					<tr>
						<td class="attribute-name">kérés objektum</td>
						<td colspan="4" class="attribute-value">
							<xsl:value-of select="requestDocument"/>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./responseDocument) &gt; 0">
					<tr>
						<td class="attribute-name">válasz objektum</td>
						<td colspan="4" class="attribute-value">
							<xsl:value-of select="responseDocument"/>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./requestExample) &gt; 0">
					<tr>
						<td class="attribute-name">kérés minta</td>
						<td colspan="3" class="program-code">
							<pre>
								<code>
									<xsl:value-of select="requestExample"/>
								</code>
							</pre>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./responseExample) &gt; 0">
					<tr>
						<td class="attribute-name">válasz minta</td>
						<td colspan="3" class="program-code">
							<pre>
								<code>
									<xsl:value-of select="responseExample"/>
								</code>
							</pre>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./callingExample) &gt; 0">
					<tr>
						<td class="attribute-name">hívási mintapélda</td>
						<td colspan="3" class="program-code">
							<pre>
								<code>
									<xsl:value-of select="callingExample"/>
								</code>
							</pre>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./argumentList) &gt; 0">
					<xsl:apply-templates select="argumentList"/>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./defaultList) &gt; 0">
					<xsl:apply-templates select="defaultList"/>
				</xsl:when>
			</xsl:choose>			
			<xsl:choose>
				<xsl:when test="count(./checkingList) &gt; 0">
					<xsl:apply-templates select="checkingList"/>
				</xsl:when>
			</xsl:choose>			
			<xsl:choose>
				<xsl:when test="count(./response) &gt; 0">
					<tr>
						<td colspan="4" class="attribute-section-header">válasz</td>
					</tr>
					<tr>
						<td class="attribute-name" colspan="2">leírás</td>
						<td class="attribute-name">adatféleség</td>
						<td class="attribute-name">megjegyzés</td>
					</tr>
					<xsl:apply-templates select="response"/>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./restService) &gt; 0">
					<xsl:apply-templates select="restService"/>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./websocketService) &gt; 0">
					<xsl:apply-templates select="websocketService"/>
				</xsl:when>
			</xsl:choose>
		</table>
	</xsl:template>
	<xsl:template match="restService">
		<tr>
			<td colspan="4" class="attribute-section-header">REST szervíz kiegészítés</td>
			<xsl:choose>
				<xsl:when test="count(./path) &gt; 0">
					<tr>
						<td class="attribute-name">elérés</td>
						<td colspan="3" class="attribute-value">
							<xsl:value-of select="path"/>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./method) &gt; 0">
					<tr>
						<td class="attribute-name">üzemmód</td>
						<td colspan="3" class="attribute-value">
							<xsl:value-of select="method"/>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./callingExample) &gt; 0">
					<tr>
						<td class="attribute-name">hívási példa</td>
						<td colspan="3" class="attribute-value">
							<xsl:value-of select="callingExample"/>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>
		</tr>
	</xsl:template>
	<xsl:template match="websocketService">
		<tr>
			<td colspan="4" class="attribute-section-header">WEBSOCKET szervíz kiegészítés</td>
			<xsl:choose>
				<xsl:when test="count(./command) &gt; 0">
					<tr>
						<td class="attribute-name">parancskód</td>
						<td colspan="3" class="attribute-value">
							<xsl:value-of select="command"/>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>
		</tr>
	</xsl:template>
	<xsl:template match="checkingList">
		<tr>
			<td colspan="4" class="attribute-section-header">ellenőrzés(ek)</td>
		</tr>
		<tr>
			<td class="attribute-name">ellenőrzési pont</td>
			<td class="attribute-name" colspan="2">meghatározás</td>
			<td class="attribute-name">üzenet</td>
		</tr>
		<xsl:apply-templates select="checking"/>
	</xsl:template>
	<xsl:template match="checking"> 
		<tr>
			<td class="attribute-value">
				<xsl:value-of select="name"/>
			</td>
			<td class="attribute-value" colspan="2">
				<xsl:value-of select="description"/>
			</td>
			<td class="program-code">
							<pre>
								<code>
									<xsl:value-of select="message"/>
								</code>
							</pre>

			</td>
		</tr>
	</xsl:template>
	<xsl:template match="defaultList">
		<tr>
			<td colspan="4" class="attribute-section-header">alapértelmezés(ek)</td>
		</tr>
		<tr>
			<td class="attribute-name" colspan="2">elem</td>
			<td class="attribute-name" colspan="2">meghatározás</td>
		</tr>
		<xsl:apply-templates select="definition"/>
	</xsl:template>
	<xsl:template match="definition">
		<tr>
			<td class="attribute-value" colspan="2">
				<xsl:value-of select="name"/>
			</td>
			<td class="attribute-value" colspan="2">
				<xsl:value-of select="description"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="argumentList">
		<tr>
			<td colspan="4" class="attribute-section-header">attribútum</td>
		</tr>
		<tr>
			<td class="attribute-name">név</td>
			<td class="attribute-name">leírás</td>
			<td class="attribute-name">adatféleség</td>
			<td class="attribute-name">megjegyzés</td>
		</tr>
		<xsl:apply-templates select="argument"/>
	</xsl:template>
	<xsl:template match="argument">
		<tr>
			<td class="attribute-value">
				<xsl:value-of select="name"/>
			</td>
			<td class="attribute-value">
				<xsl:value-of select="description"/>
			</td>
			<td class="attribute-value">
				<xsl:value-of select="dataType"/>
			</td>
			<td class="attribute-value">
				<xsl:value-of select="comment"/>
			</td>
		</tr>
	</xsl:template>	
	<xsl:template match="response">
		<tr>
			<td class="attribute-value" colspan="2">
				<xsl:value-of select="description"/>
			</td>
			<td class="attribute-value">
				<xsl:value-of select="dataType"/>
			</td>
			<td class="attribute-value">
				<xsl:value-of select="comment"/>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="classList">
		<xsl:apply-templates select="class"/>
	</xsl:template>
	<xsl:template match="class">
		<p/>
		<table border="1" class="attribute-table">
			<tr>
				<td colspan="6" class="section-header">
					<xsl:value-of select="name"/>
				</td>
			</tr>
			<xsl:choose>
				<xsl:when test="count(./description) &gt; 0">
					<tr>
						<td class="attribute-name">leírás</td>
						<td colspan="5" class="attribute-value">
							<xsl:value-of select="description"/>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./example) &gt; 0">
					<tr>
						<td class="attribute-name">példa objektum</td>
						<td colspan="5" class="program-code">
							<pre>
								<code>
									<xsl:value-of select="example"/>
								</code>
							</pre>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./ancestor) &gt; 0">
					<tr>
						<td class="attribute-name">ős</td>
						<td colspan="5" class="attribute-value">
							<xsl:value-of select="ancestor"/>
						</td>
					</tr>
				</xsl:when>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="count(./propertyList) &gt; 0">
					<xsl:apply-templates select="propertyList"/>
				</xsl:when>
			</xsl:choose>
		</table>
	</xsl:template>
	<xsl:template match="propertyList">
		<xsl:choose>
			<xsl:when test="count(./property) &gt; 0">
				<tr>
					<td colspan="6" class="attribute-section-header">jellemző</td>
				</tr>
				<tr>
					<td class="attribute-name">név</td>
					<td class="attribute-name">leírás</td>
					<td class="attribute-name">adatféleség</td>
					<td class="attribute-name">osztály</td>
					<td class="attribute-name">ős</td>
					<td class="attribute-name">megjegyzés</td>
				</tr>
				
				<xsl:apply-templates select="property"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template match="property">
		<tr>
			<td class="attribute-value">
				<xsl:value-of select="name"/>
			</td>
			<td class="attribute-value">
				<xsl:value-of select="description"/>
			</td>
			<td class="attribute-value">
				<xsl:value-of select="dataType"/>
			</td>
			<td class="attribute-value">
				<xsl:value-of select="class"/>
			</td>
			<td class="attribute-value">
				<xsl:value-of select="ancestor"/>
			</td>
			<td class="attribute-value">
				<xsl:value-of select="comment"/>
			</td>
		</tr>
	</xsl:template>
</xsl:stylesheet>
