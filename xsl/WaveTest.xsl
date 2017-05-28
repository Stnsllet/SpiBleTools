<?xml version="1.0" encoding="Shift_JIS"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0"  xmlns:spibre="http://geroha.ld.infoseek.co.jp/spibre/">
<xsl:output method="xml" version="1.0" encoding="Shift_JIS" indent="yes" />

<xsl:param name="_temp_selwav"/>

<xsl:template match="CallTrans">
	<xsl:comment>
		<xsl:text disable-output-escaping="yes">
		<![CDATA[	
			�EXML��ł̎g������
			<CallTrans params="_temp_selwav" this="WaveTest.xml" path="Xsl/WaveTest.xsl"/>

			�E�p�����[�^
			@params : ������_temp_selbgm�Œ�ł��肢���܂��B����������ꍇ��Xslt�t�@�C�����ύX���Ă��������B
			@this   : ����͂��̋L�q������t�@�C���̃p�X���w�肵�Ă��������B
				�@����Ăяo�����̂ŁA���̈�s����������t�@�C�����D�܂����ł��B
			@path   : ����Xslt�t�@�C���̃p�X�����Ă��������B
		]]>
		</xsl:text>
	</xsl:comment>
	<xsl:variable name="SeDef" select="document('../System/WaveDefine.xml')/WaveFiles"/>
	<xsl:variable name="search" select="$_temp_selwav"/>
	<xsl:variable name="this" select="@this"/>
	<xsl:element name="List">
		<xsl:for-each select="$SeDef/File[@name=$_temp_selwav]">
		<xsl:element name="Popup">
			<xsl:attribute name="msg">WaveID= <xsl:value-of select="@name"/>
				Path = <xsl:value-of select="@path"/>
				���l = <xsl:value-of select="@help"/>
			</xsl:attribute>
		</xsl:element>
		<xsl:element name="Sound">
			<xsl:attribute name="wave"><xsl:value-of select="@name"/></xsl:attribute>
		</xsl:element>
		</xsl:for-each>

		<xsl:element name="Window">
			<xsl:attribute name="x">0</xsl:attribute>
			<xsl:attribute name="y">0</xsl:attribute>
			<xsl:attribute name="w">700</xsl:attribute>
			<xsl:attribute name="h">310</xsl:attribute>
			<xsl:attribute name="life">1900</xsl:attribute>
			<xsl:attribute name="col">0</xsl:attribute>
			<xsl:attribute name="name">wavtest</xsl:attribute>
			<xsl:attribute name="title">�T�E���h�e�X�g</xsl:attribute>
			<xsl:for-each select="$SeDef/File">
			<xsl:element name="Plane">
				<xsl:attribute name="x"><xsl:value-of select="floor((position()-1) div 15) mod 15 *100 + 4"/></xsl:attribute>
				<xsl:attribute name="y"><xsl:value-of select="(position()-1) mod 15 *20 + 8"/></xsl:attribute>
				<xsl:attribute name="name"><xsl:value-of select="@name"/></xsl:attribute>
				<xsl:attribute name="event"><xsl:value-of select="$this"/></xsl:attribute>
				<xsl:attribute name="com">param/rnd/_temp_selwav/<xsl:value-of select="@name"/></xsl:attribute>
			</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:element>
</xsl:template>

</xsl:stylesheet>
