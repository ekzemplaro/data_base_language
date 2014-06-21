<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:output method="text" encoding="utf-8" />
<xsl:template match="root/*">
<xsl:value-of select="name()" /><xsl:text>&#09;</xsl:text>
<xsl:apply-templates select="name" /><xsl:text>&#09;</xsl:text>
<xsl:apply-templates select="population" /><xsl:text>&#09;</xsl:text>
<xsl:apply-templates select="date_mod" /><xsl:text>&#10;</xsl:text>
</xsl:template>
</xsl:stylesheet>
