<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.w3.org/2001/XMLSchema"
                xmlns:array="http://www.w3.org/2005/xpath-functions/array"
                xmlns:map="http://www.w3.org/2005/xpath-functions/map"
                xmlns:math="http://www.w3.org/2005/xpath-functions/math"
                xmlns:gco="http://www.isotc211.org/2005/gco"
                xmlns:gmd="http://www.isotc211.org/2005/gmd"
                exclude-result-prefixes="#all"
                version="3.0">
  
  <xsl:output method="text" indent="no"/>
  <xsl:template match="gmd:MD_Metadata">
{
    <xsl:call-template name="identification"/>,
    <xsl:call-template name="version"/>,
    <xsl:call-template name="extent"/>
}
  </xsl:template>
  
  <xsl:template name="identification" >
    "title":"<xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString"/>",
    "description":"<xsl:value-of select="normalize-space(gmd:identificationInfo/gmd:MD_DataIdentification/gmd:abstract)"/>"<xsl:text/>
  </xsl:template>
  
  <xsl:template name="version">
    <xsl:text/>"stac_version": "1.0.0",
    "stac_extensions": [
      "https://basemaps.linz.govt.nz/json-schema/stac-basemaps-extension/1.0/schema.json"
    ]<xsl:text/>
   </xsl:template>
  
  <xsl:template name="extent">
      <xsl:text/>"extent": {
      "spatial": {
        "bbox": [
          [
            <xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox/gmd:westBoundLongitude/gco:Decimal"/>,
            <xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox/gmd:southBoundLatitude/gco:Decimal"/>,
            <xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox/gmd:eastBoundLongitude/gco:Decimal"/>,
            <xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:geographicElement/gmd:EX_GeographicBoundingBox/gmd:northBoundLatitude/gco:Decimal"/>
          ]
        ]
      }
    }<xsl:text/>
  </xsl:template>
  
  <xsl:template name="license">
    
  </xsl:template>
  
  <xsl:template name="keywords">
    
  </xsl:template>
  
  <xsl:template name="providers">
    
  </xsl:template>
  
  <xsl:template name="summaries">
    
  </xsl:template>
  
  <xsl:template name="links">
    
  </xsl:template>
  
</xsl:stylesheet>
