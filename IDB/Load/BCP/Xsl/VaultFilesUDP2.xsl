<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" 
		xmlns:h="http://schemas.autodesk.com/pseb/dm/DataImport/2015-04-14"  exclude-result-prefixes="h">
	<xsl:output method="text" indent="no"/>	
	<!-- <xsl:param name="documentName"></xsl:param> -->
	<xsl:variable name="delimiter" select="';'"/>
	<!-- <xsl:variable name="test" select="document($documentName)/list/UDP"/> -->
	<xsl:key name="list_b" match="//h:Behaviors/h:PropertyDefinition/h:Assignment[@Class='File']" use="../@Name"/>
	<xsl:template match="/">
		<xsl:text>FileId;IterationId;LocalFullFileName;FileName;Category;Classification;RevisionLabel;RevisionDefinition;LifeCycleState;LifeCycleDefinition;Path</xsl:text>
		<xsl:apply-templates select="//h:Behaviors/h:PropertyDefinition/h:Assignment[@Class='File']" mode="collumn"/>
		<!-- <xsl:for-each select="$test"> -->
			<!-- <xsl:value-of select="$delimiter" /> -->
			<!-- <xsl:value-of select="." /> -->
		<!-- </xsl:for-each> -->
		<xsl:text>&#10;</xsl:text>
		<xsl:apply-templates/>
	</xsl:template>
	<xsl:template match="h:File">
		<xsl:apply-templates></xsl:apply-templates>
	</xsl:template>
	
	<xsl:template match="h:Revision">
		<xsl:apply-templates></xsl:apply-templates>
	</xsl:template>
	<xsl:template match="text()"/>
	<xsl:template match="h:Folder/h:UDP"/>
	<xsl:template match="h:Iteration">
		<xsl:value-of select="concat($delimiter,substring(@Id,2),$delimiter,@LocalPath, $delimiter, ancestor::h:File/@Name, $delimiter, ancestor::h:File/@Category, $delimiter, ancestor::h:File/@Classification, $delimiter, ancestor::h:Revision/@Label, $delimiter, ancestor::h:Revision/@Definition, $delimiter, h:State/@Name, $delimiter, h:State/@Definition)"/>
		<xsl:text>;$</xsl:text>
		<xsl:apply-templates select="ancestor-or-self::h:Folder/@Name"/>
		<xsl:text>;</xsl:text>
		<xsl:variable name="fileudps" select="."/>
		<xsl:for-each select="$list_b" >
			<xsl:variable name="udpname" select="../@Name"/>
			<!-- <xsl:value-of select="$udpname"/> -->
			<xsl:value-of select="$fileudps/h:UDP[@Name=$udpname]"/>
			<!-- <xsl:for-each select="$fileudps/h:udp"> -->
				<!-- <xsl:if test="@Name = $udpname"> -->
					<!-- <xsl:value-of select="normalize-space(.)"/> -->
				<!-- </xsl:if> -->
			<!-- </xsl:for-each> -->
			<xsl:text>;</xsl:text>
		</xsl:for-each>
		<xsl:text>&#10;</xsl:text>
	</xsl:template>
	<xsl:template match="h:Assignment[@Class = 'File']" mode="collumn">
			<xsl:value-of select="$delimiter" />
			<xsl:text>UDP_</xsl:text>
			<xsl:value-of select="../@Name"/>
	</xsl:template>
	<xsl:template match="h:Folder/@Name">
		<xsl:if test="position() > 1">/</xsl:if>
		<xsl:text>/</xsl:text>
		<xsl:value-of select="."/>
	</xsl:template>
</xsl:stylesheet>
