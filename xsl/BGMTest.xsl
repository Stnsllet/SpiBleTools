<?xml version="1.0" encoding="Shift_JIS"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"  xmlns:spibre="http://stnsllethouse.blog.fc2.com/">
<xsl:output method="xml" version="1.0" encoding="Shift_JIS" indent="yes" />

<xsl:param name="_temp_selbgm"/>

<xsl:template match="CallTrans">
	<xsl:comment>
		<xsl:text disable-output-escaping="yes">
		<![CDATA[	
			・XML上での使い方例
			<CallTrans params="_temp_selbgm" this="BGMTest.xml" path="Xsl/BGMTest.xsl"/>

			・パラメータ
			@params : ここは_temp_selbgm固定でお願いします。書き換える場合はXsltファイルも変更してください。
			@this   : これはこの記述があるファイルのパスを指定してください。
				　毎回呼び出されるので、その一行だけがあるファイルが好ましいです。
			@path   : このXsltファイルのパスを入れてください。
		]]>
		</xsl:text>
	</xsl:comment>

	<xsl:variable name="BgmDef" select="document('../System/BGMDefine.xml')/BGMFiles"/>
	<xsl:variable name="search" select="$_temp_selbgm"/>
	<xsl:variable name="this" select="@this"/>
	<xsl:element name="List">
		<xsl:for-each select="$BgmDef/File[@name=$_temp_selbgm]">
		<xsl:element name="Popup">
			<xsl:attribute name="msg">bgmID= <xsl:value-of select="@name"/>
				Path = <xsl:value-of select="@path"/>
				備考 = <xsl:value-of select="@help"/>
			</xsl:attribute>
		</xsl:element>
		<xsl:element name="Sound">
			<xsl:attribute name="bgm"><xsl:value-of select="@name"/></xsl:attribute>
		</xsl:element>
		</xsl:for-each>
		<xsl:element name="Window">
			<xsl:attribute name="x">0</xsl:attribute>
			<xsl:attribute name="y">0</xsl:attribute>
			<xsl:attribute name="w">700</xsl:attribute>
			<xsl:attribute name="h">310</xsl:attribute>
			<xsl:attribute name="life">1900</xsl:attribute>
			<xsl:attribute name="col">0</xsl:attribute>
			<xsl:attribute name="name">dataskill</xsl:attribute>
			<xsl:attribute name="title">サウンドテスト</xsl:attribute>
			<xsl:for-each select="$BgmDef/File">
			<xsl:element name="Plane">
				<xsl:attribute name="x"><xsl:value-of select="floor((position()-1) div 15) mod 15 *100 + 4"/></xsl:attribute>
				<xsl:attribute name="y"><xsl:value-of select="(position()-1) mod 15 *20 + 8"/></xsl:attribute>
				<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
				<xsl:attribute name="event"><xsl:value-of select="$this"/></xsl:attribute>
				<xsl:attribute name="com">param/rnd/_temp_selbgm/<xsl:value-of select="@name"/></xsl:attribute>
			</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:element>
</xsl:template>

</xsl:stylesheet>
