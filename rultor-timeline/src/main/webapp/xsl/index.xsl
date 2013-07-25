<?xml version="1.0"?>
<!--
 * Copyright (c) 2009-2013, rultor.com
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met: 1) Redistributions of source code must retain the above
 * copyright notice, this list of conditions and the following
 * disclaimer. 2) Redistributions in binary form must reproduce the above
 * copyright notice, this list of conditions and the following
 * disclaimer in the documentation and/or other materials provided
 * with the distribution. 3) Neither the name of the rultor.com nor
 * the names of its contributors may be used to endorse or promote
 * products derived from this software without specific prior written
 * permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT
 * NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 * FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
 * THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT,
 * INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
 * OF THE POSSIBILITY OF SUCH DAMAGE.
 -->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml" version="2.0" exclude-result-prefixes="xs">
    <xsl:output method="xml" omit-xml-declaration="yes"/>
    <xsl:include href="/xsl/layout.xsl"/>
    <xsl:template name="head">
        <title>
            <xsl:text>timelines</xsl:text>
        </title>
    </xsl:template>
    <xsl:template name="content">
        <form method="post" class="form-inline">
            <xsl:attribute name="action">
                <xsl:value-of select="/page/links/link[@rel='create']/@href"/>
            </xsl:attribute>
            <div class="input-append">
                <input name="name" type="text" class="input-xlarge" />
                <button type="submit" class="btn">
                    <xsl:text>Create</xsl:text>
                </button>
            </div>
        </form>
        <xsl:choose>
            <xsl:when test="/page/timelines/timeline">
                <ul class="nav spacious">
                    <xsl:apply-templates select="/page/timelines/timeline"/>
                </ul>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:text>Now create your first timeline and configure it as </xsl:text>
                    <a href="http://blog.rultor.com">
                        <xsl:text>this article</xsl:text>
                    </a>
                    <xsl:text> explains.</xsl:text>
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template match="timeline">
        <li>
            <ul class="inline btn-group-vertical">
                <li>
                    <a title="edit this timeline">
                        <xsl:attribute name="href">
                            <xsl:value-of select="links/link[@rel='edit']/@href"/>
                        </xsl:attribute>
                        <xsl:value-of select="name"/>
                    </a>
                </li>
                <li>
                    <a title="see it in action">
                        <xsl:attribute name="href">
                            <xsl:value-of select="links/link[@rel='see']/@href"/>
                        </xsl:attribute>
                        <i class="icon-chevron-sign-right"><xsl:comment>in action</xsl:comment></i>
                    </a>
                </li>
            </ul>
        </li>
    </xsl:template>
</xsl:stylesheet>
