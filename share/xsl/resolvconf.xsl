<?xml version="1.0"?>

<!--

 ovfdep - VMware OVF deployment helper

 Authors:
   Thomas Liske <thomas@fiasko-nw.net>

 Copyright Holder:
   2014 (C) Thomas Liske [https://fiasko-nw.net/~thomas/]

 License:
   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this package; if not, write to the Free Software
   Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301 USA

//-->


<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:oe="http://schemas.dmtf.org/ovf/environment/1">

  <xsl:output method="text"/>

  <xsl:template match="/">
	<xsl:apply-templates select="oe:Environment/oe:PropertySection/oe:Property[substring(@oe:key, 1, 4) = 'dns-']"/>
  </xsl:template>

  <xsl:template match="oe:Property[@oe:key = 'dns-nameservers']">
	<xsl:for-each select="@oe:value">
	    <xsl:call-template name="nameservers">
		<xsl:with-param name="iplist" select="."/>
	    </xsl:call-template>
	</xsl:for-each>
  </xsl:template>

  <xsl:template name="nameservers">
    <xsl:param name="iplist" select="normalize-space(.)"/>
    <xsl:choose>
	<xsl:when test="not(contains($iplist, ' '))">
	    <xsl:text>nameserver </xsl:text><xsl:value-of select="$iplist"/><xsl:text>
</xsl:text>
	</xsl:when>
	<xsl:otherwise>
	    <xsl:text>nameserver </xsl:text><xsl:value-of select="substring-before($iplist, ' ')"/><xsl:text>
</xsl:text>
	    <xsl:call-template name="nameservers">
		<xsl:with-param name="iplist" select="substring-after(normalize-space($iplist), ' ')"/>
	    </xsl:call-template>
	</xsl:otherwise>
    </xsl:choose>
  </xsl:template>

  <xsl:template match="oe:Property">
    <xsl:value-of select="substring(@oe:key, 5)"/>
    <xsl:text> </xsl:text>
    <xsl:value-of select="@oe:value"/>
    <xsl:text>
</xsl:text>
  </xsl:template>

</xsl:stylesheet>
