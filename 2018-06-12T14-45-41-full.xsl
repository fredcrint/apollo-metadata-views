<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" exclude-result-prefixes="xs" version="2.0">
    <xsl:output method="html"/>
    <xsl:template match="apolloassets">
        <html>
            <head>
                <title>change course to section</title>
                <link rel="stylesheet" type="text/css" href="standard.css"/>
                <style>
                    .lightgray{
                        color: #CCCCCC;
                    }
                    .reddo{
                        color: red;
                    }
                    .horizcenter{
                        text-align: center;
                    }
                    .nowrappot{
                        white-space: nowrap;
                    }
                    .nowrappow{
                        white-space: nowrap;
                        font-size: 7pt;
                    }
                    .wideo{
                        width: 320px;
                        font-size: 12pt;
                        white-space: nowrap;
                    }
                    .ittybitty{
                        font-size: 7pt;
                    }
                    span{
                        display: list-item;
                        width: 50px;
                        word-wrap: break-word;
                    }<!-- display: inline-block;  -->
                    .breakie{
                        word-wrap: break-word;
                    }
                    .isdone{
                        background-color: blue;
                        color: white;
                        width: 100%;
                    }
                    .isunderway{
                        background-color: #CCFFCC;
                        color: white;
                        width: 100%;
                    }
                    .isyettobe{
                        background-color: pink;
                        color: red;
                        width: 100%;
                    }
                    .isyettobenw{
                    background-color: pink;
                    color: red;
                    }</style>
            </head>
            <body>
                <table border="1">
                    <thead>
                        <tr>
                            <th>pos</th>
                            <th>part number</th>
                            <th>Radar</th>
                            <th>Box</th>
                            <th>local box folder</th>
                            <th>event last</th>
                            <th>light bulb</th>
                            <th>seed-admin</th>
                            <th>staging</th>
                            <th>last stamp</th>
                            <!-- <th>AT level 01</th>
                            <th>AT level 02</th>
                            <th>AT level 03</th>
                            <th>AT level 04</th> -->
                            <th>Asset tracking and Box levels</th>
                            <!-- <th>Box data item type</th> -->
                            <th>Title perspectives</th>
                        </tr>
                    </thead>
                    <tbody>
                        <xsl:for-each select="apolloasset">
                            <xsl:sort select="apppartnumber"/>
                            <xsl:sort select="history/event/stamp"/>
                            <xsl:if test="contains(apppartnumber, '_')">

                                <!-- contains(apppartnumber,'T016371A-en_WW') or contains(apppartnumber,'T016762A-en_WW') -->
                                <tr>
                                    <td>
                                        <xsl:value-of select="position()"/>
                                    </td>
                                    <td class="wideo">
                                        <xsl:value-of select="apppartnumber"/>
                                        <br/>
                                        <xsl:value-of select="history/event/stamp"/>
                                    </td>
                                    <td>
                                        <xsl:for-each select="history/event">
                                            <xsl:if test="contains(url1, 'rdar')">
                                                <xsl:value-of select="url1"/>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </td>
                                    <td>
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">
                                                <xsl:text>https://apple.ent.box.com/folder/</xsl:text>
                                                <xsl:value-of select="boxid"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="target">
                                                <xsl:text>_blank</xsl:text>
                                            </xsl:attribute>
                                            <xsl:value-of select="boxid"/>
                                        </xsl:element>
                                    </td>
                                    <td>
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">
                                                <xsl:text>../boxfolders/</xsl:text>
                                                <xsl:value-of select="boxid"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="target">
                                                <xsl:text>_blank</xsl:text>
                                            </xsl:attribute>
                                            <xsl:text>box folder</xsl:text>
                                        </xsl:element>
                                        <br/>
                                        <xsl:value-of select="boxid"/>
                                    </td>
                                    <td class="nowrappot">
                                        <xsl:for-each select="history/event">
                                            <xsl:if test="position() = last()">
                                                <xsl:choose>
                                                    <xsl:when test="template">
                                                        <xsl:choose>
                                                            <xsl:when test="template/@conventionaltemplate = 'none'">
                                                                <xsl:value-of select="subjectline/@localfoldername"/>
                                                                <br/>
                                                                <xsl:element name="a">
                                                                    <xsl:attribute name="href">
                                                                        <xsl:text>../boxfolders/</xsl:text>
                                                                        <xsl:value-of select="../../boxid"/>
                                                                        <xsl:text>/</xsl:text>
                                                                        <xsl:value-of select="subjectline/@localfoldername"/>
                                                                        <xsl:text>/</xsl:text>
                                                                        <xsl:value-of select="substring(subjectline/@filename, 1, string-length(subjectline/@filename) - 4)"/>
                                                                        <xsl:text>/index.html</xsl:text>
                                                                    </xsl:attribute>
                                                                    <xsl:attribute name="target">
                                                                        <xsl:text>_blank</xsl:text>
                                                                    </xsl:attribute>
                                                                    <xsl:text>index.html</xsl:text>
                                                                </xsl:element>
                                                            </xsl:when>
                                                            <xsl:when test="template/@conventionaltemplate = 'longform'">
                                                                <xsl:value-of select="subjectline/@localfoldername"/>
                                                                <br/>
                                                                <xsl:element name="a">
                                                                    <xsl:attribute name="href">
                                                                        <xsl:text>../boxfolders/</xsl:text>
                                                                        <xsl:value-of select="../../boxid"/>
                                                                        <xsl:text>/</xsl:text>
                                                                        <xsl:value-of select="subjectline/@localfoldername"/>
                                                                        <xsl:text>/</xsl:text>
                                                                        <xsl:value-of select="substring(subjectline/@filename, 1, string-length(subjectline/@filename) - 4)"/>
                                                                        <xsl:text>.html</xsl:text>
                                                                    </xsl:attribute>
                                                                    <xsl:attribute name="target">
                                                                        <xsl:text>_blank</xsl:text>
                                                                    </xsl:attribute>
                                                                    <xsl:value-of select="substring(subjectline/@filename, 1, string-length(subjectline/@filename) - 4)"/>
                                                                    <xsl:text>.html</xsl:text>
                                                                </xsl:element>
                                                            </xsl:when>
                                                            <xsl:otherwise>
                                                                <xsl:value-of select="subjectline/@localfoldername"/>
                                                                <br/>
                                                                <xsl:element name="a">
                                                                    <xsl:attribute name="href">
                                                                        <xsl:text>../boxfolders/</xsl:text>
                                                                        <xsl:value-of select="../../boxid"/>
                                                                        <xsl:text>/</xsl:text>
                                                                        <xsl:value-of select="subjectline/@localfoldername"/>
                                                                        <xsl:text>/</xsl:text>
                                                                        <xsl:value-of select="substring(subjectline/@filename, 1, string-length(subjectline/@filename) - 4)"/>
                                                                        <xsl:text>/index.empower.js</xsl:text>
                                                                    </xsl:attribute>
                                                                    <xsl:attribute name="target">
                                                                        <xsl:text>_blank</xsl:text>
                                                                    </xsl:attribute>
                                                                    <xsl:text>index.empower.js</xsl:text>
                                                                </xsl:element>
                                                            </xsl:otherwise>
                                                        </xsl:choose>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="subjectline/@localfoldername"/>
                                                        <br/>
                                                        <xsl:element name="a">
                                                            <xsl:attribute name="href">
                                                                <xsl:text>../boxfolders/</xsl:text>
                                                                <xsl:value-of select="../../boxid"/>
                                                                <xsl:text>/</xsl:text>
                                                                <xsl:value-of select="subjectline/@localfoldername"/>
                                                                <xsl:text>/</xsl:text>
                                                                <xsl:value-of select="substring(subjectline/@filename, 1, string-length(subjectline/@filename) - 4)"/>
                                                                <xsl:text>/index.empower.js</xsl:text>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="target">
                                                                <xsl:text>_blank</xsl:text>
                                                            </xsl:attribute>
                                                            <xsl:text>index.empower.js</xsl:text>
                                                        </xsl:element>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:if>
                                        </xsl:for-each>
                                    </td>
                                    <td class="horizcenter">
                                        <xsl:choose>
                                            <xsl:when test="(contains(boxlevel04, 'CYK')) or (contains(boxlevel04, 'Check')) or (contains(assettrackerlevel04, 'CYK')) or (contains(assettrackerlevel04, 'Check'))">
                                                <xsl:choose>
                                                    <xsl:when test="(contains(assettrackerlevel01, 'Dev')) or (contains(boxlevel01, 'Dev'))">
                                                        <xsl:element name="img">
                                                            <xsl:attribute name="src">
                                                                <xsl:text>images/APP_thumb_720x720_AppDeveloper-CheckYourKnowledge_3.18.30_PM.png</xsl:text>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="height">18</xsl:attribute>
                                                            <xsl:attribute name="width">18</xsl:attribute>
                                                        </xsl:element>
                                                    </xsl:when>
                                                    <xsl:when test="(contains(assettrackerlevel01, 'IT')) or (contains(boxlevel01, 'IT'))">
                                                        <xsl:element name="img">
                                                            <xsl:attribute name="src">
                                                                <xsl:text>images/APP_thumb_720x720_IT-CheckYourKnowledge.png</xsl:text>
                                                            </xsl:attribute>
                                                            <xsl:attribute name="height">18</xsl:attribute>
                                                            <xsl:attribute name="width">18</xsl:attribute>
                                                        </xsl:element>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:text>&#160;</xsl:text>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </td>
                                    <td>
                                        <xsl:element name="a">
                                            <xsl:attribute name="href">
                                                <xsl:text>https://sales.corp.apple.com/seed-admin/#!/resources/view/</xsl:text>
                                                <xsl:value-of select="apppartnumber"/>
                                            </xsl:attribute>
                                            <xsl:attribute name="target">
                                                <xsl:text>_blank</xsl:text>
                                            </xsl:attribute>
                                            <xsl:value-of select="apppartnumber"/>
                                        </xsl:element>
                                    </td>

                                    <td>
                                        <xsl:choose>
                                            <xsl:when test="substring(apppartnumber, 1, 1) = 'R'">
                                                <xsl:element name="a">
                                                    <xsl:attribute name="href">
                                                        <xsl:text>https://app001.apple.com/desktop/#/home/resources/collection/</xsl:text>
                                                        <xsl:value-of select="apppartnumber"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="target">
                                                        <xsl:text>_blank</xsl:text>
                                                    </xsl:attribute>
                                                    <xsl:value-of select="apppartnumber"/>
                                                </xsl:element>
                                            </xsl:when>
                                            <xsl:when test="substring(apppartnumber, 1, 1) = 'T'">
                                                <xsl:element name="a">
                                                    <xsl:attribute name="href">
                                                        <xsl:text>https://app001.apple.com/desktop/#/home/resources/asset/</xsl:text>
                                                        <xsl:value-of select="apppartnumber"/>
                                                    </xsl:attribute>
                                                    <xsl:attribute name="target">
                                                        <xsl:text>_blank</xsl:text>
                                                    </xsl:attribute>
                                                    <xsl:value-of select="apppartnumber"/>
                                                </xsl:element>
                                            </xsl:when>
                                        </xsl:choose>
                                    </td>
                                    <td>
                                        <ol>
                                            <xsl:for-each select="history/event">
                                                <li>
                                                    <xsl:choose>
                                                        <xsl:when test="position() = last()">
                                                            <xsl:value-of select="stamp"/>
                                                            <br/>
                                                            <xsl:value-of select="subjectline/@generated"/>
                                                            <br/> (<xsl:value-of select="subjectline/@localfoldername"/>) <xsl:if test="generalnotes != ''">
                                                                <br/>
                                                                <table border="1" width="240px">
                                                                    <tr>
                                                                        <td class="breakie">
                                                                            <xsl:value-of select="generalnotes"/>
                                                                        </td>
                                                                    </tr>
                                                                    <xsl:if test="subjectline/@extra != ''">
                                                                        <tr>
                                                                            <td style="background-color: yellow;">
                                                                                <xsl:value-of select="subjectline/@extra"/>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:if>
                                                                    <xsl:if test="subjectline/@filename">
                                                                        <td><!-- not drafted -->
                                                                            <xsl:choose>
                                                                                <xsl:when test="subjectline/@requeststatus">
                                                                                    <xsl:choose>
                                                                                        <xsl:when test="subjectline/@requeststatus = '10 done'">
                                                                                            <span class="isdone">
                                                                                                <xsl:value-of select="subjectline/@filename"/>
                                                                                            </span>
                                                                                        </xsl:when>
                                                                                        <xsl:when test="contains(subjectline/@requeststatus, 'action complete')">
                                                                                            <span class="isdone">
                                                                                                <xsl:value-of select="subjectline/@filename"/>
                                                                                            </span>
                                                                                        </xsl:when>
                                                                                        <xsl:when test="contains(subjectline/@requeststatus, 'awaiting ruling')">
                                                                                            <span class="isunderway">
                                                                                                <xsl:value-of select="subjectline/@filename"/>
                                                                                            </span>
                                                                                        </xsl:when>
                                                                                        <xsl:when test="subjectline/@requeststatus = 'sent'">
                                                                                            <span class="isunderway">
                                                                                                <xsl:value-of select="subjectline/@filename"/>
                                                                                            </span>
                                                                                        </xsl:when>
                                                                                        <xsl:when test="subjectline/@requeststatus = 'not drafted'">
                                                                                            <span class="isyettobe">
                                                                                                <xsl:value-of select="subjectline/@filename"/>
                                                                                            </span>
                                                                                        </xsl:when>
                                                                                        <xsl:otherwise>
                                                                                            <xsl:value-of select="subjectline/@filename"/>
                                                                                        </xsl:otherwise>
                                                                                    </xsl:choose>
                                                                                </xsl:when>
                                                                                <xsl:otherwise>
                                                                                    <xsl:value-of select="subjectline/@filename"/>
                                                                                </xsl:otherwise>
                                                                            </xsl:choose>
                                                                        </td>
                                                                    </xsl:if>
                                                                </table>
                                                            </xsl:if>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:value-of select="stamp"/>
                                                            <br/>
                                                            <xsl:value-of select="subjectline/@generated"/>
                                                            <br/> (<xsl:value-of select="subjectline/@localfoldername"/>) <xsl:if test="generalnotes != ''">
                                                                <br/>
                                                                <table border="1" width="240px">
                                                                    <tr>
                                                                        <td class="breakie">
                                                                            <xsl:value-of select="generalnotes"/>
                                                                        </td>
                                                                    </tr>
                                                                    <xsl:if test="subjectline/@extra != ''">
                                                                        <tr>
                                                                            <td style="background-color: yellow;">
                                                                                <xsl:value-of select="subjectline/@extra"/>
                                                                            </td>
                                                                        </tr>
                                                                    </xsl:if>
                                                                    <xsl:if test="subjectline/@filename">
                                                                        <td>
                                                                            <xsl:value-of select="subjectline/@filename"/>
                                                                        </td>
                                                                    </xsl:if>
                                                                </table>
                                                            </xsl:if>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </li>
                                            </xsl:for-each>
                                        </ol>
                                    </td>
                                        <br/> 1 <xsl:value-of select="boxlevel01"/><xsl:if test="boxlevel01/@id != ''"><xsl:text> (</xsl:text><xsl:value-of select="boxlevel01/@id"/><xsl:text>)</xsl:text></xsl:if>
                                        <br/> 2 <xsl:value-of select="boxlevel02"/><xsl:if test="boxlevel02/@id != ''"><xsl:text> (</xsl:text><xsl:value-of select="boxlevel02/@id"/><xsl:text>)</xsl:text></xsl:if>
                                        <br/> 3 <xsl:value-of select="boxlevel03"/><xsl:if test="boxlevel03/@id != ''"><xsl:text> (</xsl:text><xsl:value-of select="boxlevel03/@id"/><xsl:text>)</xsl:text></xsl:if>
                                        <br/> 4 <xsl:value-of select="boxlevel04"/><xsl:if test="boxlevel04/@id != ''"><xsl:text> (</xsl:text><xsl:value-of select="boxlevel04/@id"/><xsl:text>)</xsl:text></xsl:if>
                                    </td>
                                    <td>
                                        <i>
                                            <xsl:text>Apollo SEED metadata:</xsl:text>
                                        </i>
                                        <ol>
                                            <xsl:for-each select="seedexportspreadsheetrow/sscol">
                                                <xsl:choose>
                                                    <xsl:when test="./@name = 'title'">
                                                        <li>
                                                            <xsl:value-of select="."/>
                                                            <xsl:text> COMPARE TO STAGED TITLE</xsl:text>
                                                        </li>
                                                    </xsl:when>
                                                    <xsl:when test="./@name = 'workingtitle'">
                                                        <li>
                                                            <xsl:value-of select="."/>
                                                        </li>
                                                    </xsl:when>
                                                    <xsl:when test="./@name = 'searchtag'">
                                                        <li>
                                                            <xsl:value-of select="."/>
                                                            <xsl:text> SEARCH TAG</xsl:text>
                                                        </li>
                                                    </xsl:when>
                                                </xsl:choose>
                                            </xsl:for-each>
                                        </ol>
                                        <br/>
                                        <i>
                                            <xsl:text>Staged:</xsl:text>
                                        </i>
                                        <br/>
                                            <xsl:for-each select="history/event">
                                                <xsl:if test="position() = last()">
                                                    <xsl:if test="surtitle">
                                                            <xsl:choose>
                                                                <xsl:when test="title = ../../assettrackerlevel04">
                                                                    <p><xsl:text> (</xsl:text>
                                                                    <xsl:value-of select="stamp"/>
                                                                    <xsl:text>)</xsl:text>
                                                                    <br/>
                                                                    <xsl:value-of select="surtitle"/>
                                                                    <br/>
                                                                    <xsl:value-of select="title"/></p>
                                                                </xsl:when>
                                                                <xsl:otherwise>
                                                                    <p><xsl:text> (</xsl:text>
                                                                    <xsl:value-of select="stamp"/>
                                                                    <xsl:text>)</xsl:text>
                                                                    <br/>
                                                                    <xsl:value-of select="surtitle"/>
                                                                    <br/>
                                                                    <xsl:value-of select="title"/>
                                                                    <br/>
                                                                    <xsl:text>NOTE: The title published, </xsl:text>
                                                                    <xsl:value-of select="title"/>
                                                                    <xsl:text>, and the title tracked, </xsl:text>
                                                                    <xsl:value-of select="../../assettrackerlevel04"/>
                                                                    <xsl:text>, do not match. Check Apollo SEED metadata as well.</xsl:text>
                                                                    </p>
                                                                </xsl:otherwise>
                                                            </xsl:choose>
                                                    </xsl:if>
                                                </xsl:if>
                                            </xsl:for-each>
                                    </td>
                                    <!-- <td>
                                        <xsl:element name="img">
                                            <xsl:attribute name="src">
                                                <xsl:text>../boxfolders/</xsl:text>
                                                <xsl:value-of select="boxid"/>
                                                <xsl:text>/</xsl:text>
                                                <xsl:value-of select="boxid"/>
                                                <xsl:text>.png</xsl:text>
                                            </xsl:attribute>
                                        </xsl:element>
                                    </td> -->
                                </tr>
                            </xsl:if>
                        </xsl:for-each>
                    </tbody>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
