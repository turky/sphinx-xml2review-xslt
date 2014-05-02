<!-- 
    sphinxxml2review.xslt
    XSL Template convert xml files processed 
    by Sphinx document processing tool.

    written by Akihiro Takizawa <atakizawa@oreilly.co.jp> 

    THIS FILE IS EXPERIMANTAL STATUS. PLASE USE IT BY YOUR OWN RISK.
 -->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xlink="http://www.w3.org/1999/xlink">
<xsl:output method="text" encoding="utf-8" />

<xsl:template match="/">
<xsl:apply-templates select="document" />
</xsl:template>

<xsl:template match="document">
<xsl:apply-templates />
</xsl:template>

<!-- headers -->
<xsl:template match="/document/section">
= <xsl:value-of select="title" /><xsl:text>
</xsl:text><xsl:text>
</xsl:text>
<xsl:apply-templates select="*[not(self::title)]"/>
</xsl:template>

<xsl:template match="/document/section/section">
<xsl:text>
</xsl:text>== <xsl:value-of select="title" /><xsl:text>
</xsl:text><xsl:text>
</xsl:text>
<xsl:apply-templates select="*[not(self::title)]" />
</xsl:template>

<xsl:template match="/document/section/section/section">
<xsl:text>
</xsl:text>=== <xsl:value-of select="title" /><xsl:text>
</xsl:text><xsl:text>
</xsl:text>
<xsl:apply-templates select="*[not(self::title)]" />
</xsl:template>

<xsl:template match="/document/section/section/section/section">
<xsl:text>
</xsl:text>==== <xsl:value-of select="title" /><xsl:text>
</xsl:text><xsl:text>
</xsl:text>
<xsl:apply-templates select="*[not(self::title)]" />
</xsl:template>

<!-- block elements -->
<xsl:template match="paragraph">
<xsl:apply-templates /><xsl:text>
</xsl:text>
</xsl:template>

<xsl:template match="bullet_list">
<xsl:text>
</xsl:text><xsl:for-each select="list_item"> * <xsl:apply-templates /></xsl:for-each>
</xsl:template>

<xsl:template match="definition_list">
<xsl:text>
</xsl:text><xsl:for-each select="definition_list_item">
 : <xsl:value-of select="term" /><xsl:text>
&#x9;</xsl:text>
<xsl:apply-templates select="definition" />
</xsl:for-each>
</xsl:template>

<xsl:template match="extcode">
<xsl:apply-templates />
</xsl:template>

<xsl:template match="definition">
<xsl:apply-templates />
</xsl:template>

<xsl:template match="literal_block">
//emlist{
<xsl:apply-templates />
//}
</xsl:template>

<xsl:template match="programlisting">
//emlist{
<xsl:apply-templates />
//}
</xsl:template>

<xsl:template match="image">
<xsl:choose><xsl:when test="name(..)='figure'"></xsl:when>
<xsl:otherwise>//indepimage[<xsl:value-of select="@uri" />]</xsl:otherwise>
</xsl:choose>
</xsl:template>

<xsl:template match="figure">
//image[<xsl:value-of select="image/@uri" />][<xsl:value-of select="caption" />]{
<xsl:value-of select="legend" />
//}<xsl:text>
</xsl:text>
</xsl:template>

<xsl:template match="legend">
<xsl:apply-templates />
</xsl:template>

<xsl:template match="footnote">//footnote[<xsl:value-of select="@backrefs" />][<xsl:apply-templates select="*[not(self::label)]"/>]<xsl:text>
</xsl:text></xsl:template>

<xsl:template match="admonition">
=====[column] <xsl:value-of select="title" /><xsl:text>
</xsl:text>
<xsl:apply-templates select="*[not(self::title)]" />
=====[/column]<xsl:text>
</xsl:text></xsl:template>

<xsl:template match="table">
//table[][<xsl:value-of select="title" />]{
<xsl:apply-templates select="*[not(self::title)]" />
//}
</xsl:template>

<xsl:template match="tgroup">
<xsl:apply-templates />
</xsl:template>

<xsl:template match="thead">
<xsl:for-each select="row/entry">
<xsl:choose>
<xsl:when test="count(.)=0"><xsl:text>.&#x9;</xsl:text></xsl:when>
<xsl:otherwise><xsl:apply-templates /><xsl:text>&#x9;</xsl:text></xsl:otherwise>
</xsl:choose>
</xsl:for-each>
====================================================
</xsl:template>

<xsl:template match="tbody">
<xsl:for-each select="row">
<xsl:for-each select="entry">
<xsl:choose>
<xsl:when test="count(.)=0"><xsl:text>.&#x9;</xsl:text></xsl:when>
<xsl:otherwise><xsl:apply-templates /><xsl:text>&#x9;</xsl:text></xsl:otherwise>
</xsl:choose>
</xsl:for-each><xsl:text>
</xsl:text>
</xsl:for-each>
</xsl:template>

<xsl:template match="tip">
//tip{
<xsl:apply-templates />
//}
</xsl:template>

<xsl:template match="note">
//note{
<xsl:apply-templates />
//}
</xsl:template>

<xsl:template match="caution">
//caution{
<xsl:apply-templates />
//}
</xsl:template>

<xsl:template match="comment">
#@# <xsl:apply-templates />
#@# comment end
</xsl:template>

<!-- inline elements -->
<xsl:template match="footnote_reference">@&lt;fn&gt;{<xsl:value-of select="@ids" />}</xsl:template>

<xsl:template match="emphasis">@&lt;b&gt;{<xsl:apply-templates />}</xsl:template>

<xsl:template match="reference">@&lt;href&gt;{<xsl:value-of select='@refuri' />,<xsl:apply-templates />}</xsl:template>

<xsl:template match="literal">@&lt;tt&gt;{<xsl:apply-templates />}</xsl:template>

<xsl:template match="strong">@&lt;ttb&gt;{<xsl:apply-templates />}</xsl:template>

<xsl:template match="desc">
<xsl:apply-templates />
</xsl:template>

<xsl:template match="desc_signature"> : @&lt;ttb&gt;{<xsl:apply-templates />}</xsl:template>
<xsl:template match="desc_parameterlist"><xsl:for-each select="."><xsl:apply-templates /></xsl:for-each></xsl:template>
<xsl:template match="desc_optional"> [<xsl:apply-templates />]</xsl:template>
<xsl:template match="desc_parameter"> @&lt;tti&gt;{<xsl:apply-templates />}</xsl:template>

<xsl:template match="desc_content"><xsl:apply-templates /></xsl:template>

<!-- text -->
<xsl:template match="text()">
<xsl:choose>
<xsl:when test="name(..)='paragraph'"><xsl:value-of select="normalize-space(.)" /></xsl:when>
<xsl:otherwise><xsl:value-of select="." /></xsl:otherwise>
</xsl:choose>
</xsl:template>

</xsl:stylesheet>
