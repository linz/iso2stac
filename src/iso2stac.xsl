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
    <xsl:call-template name="providers"/>,
    <xsl:call-template name="license" />,
    <xsl:call-template name="keywords" />,
    <xsl:call-template name="extent"/>,
    <xsl:call-template name="summaries"/>,
    <xsl:call-template name="links"/>
}
  </xsl:template>
  
  <xsl:template name="identification" >
    "id": "XXXX-Need-to-discuss-XXXX",
    "type": "Collection",
    "title": "<xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:citation/gmd:CI_Citation/gmd:title/gco:CharacterString"/>",
    "description": "<xsl:value-of select="normalize-space(gmd:identificationInfo/gmd:MD_DataIdentification/gmd:abstract)"/>"<xsl:text/>
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
      },
      "temporal": {
        "interval": [
          [
            <!-- TODO: Not tested. Get dataset that includes this element. -->
            <xsl:value-of select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:extent/gmd:EX_Extent/gmd:temporalElement"/><xsl:text/>
          ]
        ]
      }
    }<xsl:text/>
  </xsl:template>
  
  <xsl:template name="license">
    "license":"CC-BY-4.0",
    "linz:copyright":[<xsl:text/>
    <xsl:for-each select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:resourceConstraints/gmd:MD_LegalConstraints/gmd:useLimitation/gco:CharacterString">
      <xsl:if test="not(position()=1)">,</xsl:if>
          "<xsl:value-of select="translate(normalize-space(.), '\&quot;', '\&apos;&apos;')"/>"<xsl:text/>
      </xsl:for-each>]<xsl:text/>
  </xsl:template>
  
  <xsl:template name="keywords">
    "keywords": [
      "HARDCODED FOR TEST DATA",
      "Imagery",
      "New Zealand",
      "Aerial",
      "Urban"
    ]<xsl:text/>
  </xsl:template>
  
  <xsl:template name="providers">
    "providers": [
    {
      "name": "Toitū Te Whenua Land Information New Zealand",
      "description": "We make sure New Zealand has accurate information about where people and places are, people have confidence in their property rights and Crown property is well managed for future generations.",
      "roles": [
        "host",
        "processor"
      ],
      "url": "https://data.linz.govt.nz/"
    }]<xsl:text/>
    <!-- Leaving out the data from providers in the ISO source as they are in LDS because they don't have roles 
     <xsl:for-each select="gmd:identificationInfo/gmd:MD_DataIdentification/gmd:pointOfContact/gmd:CI_ResponsibleParty">
        <xsl:if test="not(position()=1)">,</xsl:if>
        "<xsl:value-of select="translate(gmd:organisationName/gco:CharacterString, '\&quot;', '\&apos;&apos;')"/>"<xsl:text/>
    </xsl:for-each> -->
  </xsl:template>
  
  <xsl:template name="summaries">
    "summaries": {
      "gsd": [
        0.075
      ],
      "proj:epsg": [
        3857
      ],
      "linz:output": [
        {
          "resampling": {
            "warp": "bilinear",
            "overview": "lanczos"
          },
          "quality": 90,
          "cutlineBlend": 20,
          "addAlpha": true,
          "nodata": 255
        }
      ],
      "linz:generated": [
        {
          "package": "@basemaps/cli",
          "version": "4.15.0",
          "hash": "ad912cfb8cb56516c481de8ccbba32db7fa78bcb",
          "datetime": "2020-10-12T21:18:57.206Z"
        }
      ]
    }<xsl:text/>
  </xsl:template>
  
  <xsl:template name="links">
      "links": [
      {
        "href": "s3://the-bucket-where-this-is/collection.json",
        "type": "application/json",
        "rel": "self"
      }]<xsl:text/>
  </xsl:template>
  
</xsl:stylesheet>
