prompt --application/pages/page_00032
begin
--   Manifest
--     PAGE: 00032
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>47527763449748886
,p_default_application_id=>236
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WS155830'
);
wwv_flow_imp_page.create_page(
 p_id=>32
,p_name=>'Mecz'
,p_alias=>'MECZ21'
,p_step_title=>'Mecz'
,p_allow_duplicate_submissions=>'N'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Scroll Results Only in Side Column */',
'.t-Body-side {',
'    display: flex;',
'    flex-direction: column;',
'    overflow: hidden;',
'}',
'.search-results {',
'    flex: 1;',
'    overflow: auto;',
'}',
'/* Format Search Region */',
'.search-region {',
'    border-bottom: 1px solid rgba(0,0,0,.1);',
'    flex-shrink: 0;',
'}'))
,p_step_template=>wwv_flow_imp.id(167634773509662969)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(174967280352992384)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167746708932663065)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(167631056795662963)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(167809543388663118)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(174968720452992386)
,p_plug_name=>'Search'
,p_region_name=>'IR_MECZ_SEARCH'
,p_region_css_classes=>'search-region padding-md'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(174969573964992387)
,p_name=>'Master Records'
,p_template=>wwv_flow_imp.id(167669144131663001)
,p_display_sequence=>20
,p_region_css_classes=>'search-results'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'t-MediaList--showDesc:t-MediaList--stack'
,p_display_point=>'REGION_POSITION_02'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    M.MeczID,',
'    null AS LINK_CLASS,',
'    apex_page.get_url(p_items => ''P32_MECZID'', p_values => M.MeczID) AS LINK,',
'    null AS ICON_CLASS,',
'    null AS LINK_ATTR,',
'    null AS ICON_COLOR_CLASS,',
'    case ',
'        when coalesce(:P32_MECZID, ''0'') = M.MeczID then ''is-active'' ',
'        else '' '' ',
'    end AS LIST_CLASS,',
'    (substr(Gosp.Nazwa, 1, 50) || '' - '' || substr(Gosc.Nazwa, 1, 50) || ',
'        (case when length(Gosp.Nazwa) > 50 or length(Gosc.Nazwa) > 50 then ''...'' else '''' end)) AS LIST_TITLE,  -- Primary Display Column',
'    TO_CHAR(M.DataMeczu, ''YYYY-MM-DD'') AS LIST_TEXT,  -- Secondary Display Column',
'    null AS LIST_BADGE',
'FROM ',
'    Mecz M',
'JOIN ',
'    Klub Gosp ON M.KlubGospID = Gosp.KlubID',
'JOIN ',
'    Klub Gosc ON M.KlubGoscID = Gosc.KlubID',
'WHERE ',
'    (:P32_SEARCH IS NULL',
'     OR upper(Gosp.Nazwa) LIKE ''%'' || upper(:P32_SEARCH) || ''%''',
'     OR upper(Gosc.Nazwa) LIKE ''%'' || upper(:P32_SEARCH) || ''%'')',
'ORDER BY ',
'    M.DataMeczu;',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P32_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167769503014663084)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'<div class="u-tC">No data found.</div>'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174970150600992390)
,p_query_column_id=>1
,p_column_alias=>'MECZID'
,p_column_display_sequence=>1
,p_column_heading=>'MECZID'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174852874113062343)
,p_query_column_id=>2
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>13
,p_column_heading=>'Link Class'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174970964977992391)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>3
,p_column_heading=>'LINK'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174852971736062344)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>23
,p_column_heading=>'Icon Class'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174853044845062345)
,p_query_column_id=>5
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>33
,p_column_heading=>'Link Attr'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174853155072062346)
,p_query_column_id=>6
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>43
,p_column_heading=>'Icon Color Class'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174853292793062347)
,p_query_column_id=>7
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>53
,p_column_heading=>'List Class'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174853396132062348)
,p_query_column_id=>8
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>63
,p_column_heading=>'List Title'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174853499716062349)
,p_query_column_id=>9
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>73
,p_column_heading=>'List Text'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174853598038062350)
,p_query_column_id=>10
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>83
,p_column_heading=>'List Badge'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(174974190929992408)
,p_name=>'Mecz'
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>10
,p_region_css_classes=>'js-master-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    M.MeczID,',
'    Gosp.Nazwa AS Gospodarz,',
unistr('    Gosc.Nazwa AS Go\015B\0107,'),
'    TO_CHAR(M.DataMeczu, ''YYYY-MM-DD'') AS Data_meczu,',
'    M.WynikKoncowy AS Wynik,',
'    M.NrKolejki AS Kolejka,',
unistr('    Sg.IMIE || '' '' || Sg.Nazwisko AS S\0119dzia_g\0142\00F3wny,'),
'    As1.IMIE || '' '' || As1.Nazwisko AS SEDZIA_AS1,',
'    As2.IMIE || '' '' || As2.Nazwisko AS SEDZIA_AS2',
'FROM ',
'    Mecz M',
'JOIN ',
'    Klub Gosp ON M.KlubGospID = Gosp.KlubID',
'JOIN ',
'    Klub Gosc ON M.KlubGoscID = Gosc.KlubID',
'JOIN ',
'    Sedzia Sg ON M.SedziaGlownyID = Sg.SedziaID',
'JOIN ',
'    Sedzia As1 ON M.SedziaAs1ID = As1.SedziaID',
'JOIN ',
'    Sedzia As2 ON M.SedziaAs2ID = As2.SedziaID',
'WHERE ',
'    M.MeczID = :P32_MECZID',
'ORDER BY ',
'    M.DataMeczu;',
''))
,p_display_when_condition=>'P32_MECZID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167775742755663089)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No Record Selected'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174974803143992410)
,p_query_column_id=>1
,p_column_alias=>'MECZID'
,p_column_display_sequence=>1
,p_column_heading=>'Meczid'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "MECZ"',
'where "MECZID" is not null',
'and "MECZID" = :P32_MECZID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(175021515470121601)
,p_query_column_id=>2
,p_column_alias=>'GOSPODARZ'
,p_column_display_sequence=>11
,p_column_heading=>'Gospodarz'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(175021631801121602)
,p_query_column_id=>3
,p_column_alias=>unistr('GO\015A\0106')
,p_column_display_sequence=>21
,p_column_heading=>unistr('Go\015B\0107')
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(175021719250121603)
,p_query_column_id=>4
,p_column_alias=>'DATA_MECZU'
,p_column_display_sequence=>81
,p_column_heading=>'Data meczu'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174852142077062336)
,p_query_column_id=>5
,p_column_alias=>'WYNIK'
,p_column_display_sequence=>31
,p_column_heading=>'Wynik'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174852277740062337)
,p_query_column_id=>6
,p_column_alias=>'KOLEJKA'
,p_column_display_sequence=>71
,p_column_heading=>'Kolejka'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(175021852032121604)
,p_query_column_id=>7
,p_column_alias=>unistr('S\0118DZIA_G\0141\00D3WNY')
,p_column_display_sequence=>41
,p_column_heading=>unistr('S\0119dzia g\0142\00F3wny')
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174852427133062339)
,p_query_column_id=>8
,p_column_alias=>'SEDZIA_AS1'
,p_column_display_sequence=>51
,p_column_heading=>unistr('S\0119dzia asystent nr 1')
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(174852562644062340)
,p_query_column_id=>9
,p_column_alias=>'SEDZIA_AS2'
,p_column_display_sequence=>61
,p_column_heading=>unistr('S\0119dzia asystent nr 2')
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(174984503507992420)
,p_plug_name=>'Region Display Selector'
,p_region_css_classes=>'js-detail-rds'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_num_rows=>15
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P32_MECZID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(304837330505072946)
,p_name=>'Zmiany'
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>100
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlightOff'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ZMZ.ZmianaID,',
'    ZM.Minuta,',
'    ZMZ.ZdarzenieMeczID,',
'    M.KlubGospID,',
'    M.KlubGoscID,',
'    ZMZ.ZawodnikWchodzacyID,',
'    ZMZ.ZawodnikSchodzacyID,',
'    M.MeczID,',
'    M.SedziaGlownyID,',
'    ',
'    CASE',
'        WHEN ZawodnikSchodzacy.KlubID = M.KlubGospID ',
unistr('        THEN ''Wszed\0142: '' || ZawodnikWchodzacy.Nazwisko || '', Zszed\0142: '' || ZawodnikSchodzacy.Nazwisko'),
'        ELSE NULL',
'    END AS Gospodarz_zmiany,',
'',
'    CASE',
'        WHEN ZawodnikSchodzacy.KlubID = M.KlubGoscID ',
unistr('        THEN ''Wszed\0142: '' || ZawodnikWchodzacy.Nazwisko || '', Zszed\0142: '' || ZawodnikSchodzacy.Nazwisko'),
'        ELSE NULL',
'    END AS Gosc_zmiany,',
unistr('    ''Edytuj zmian\0119'' AS Edytuj'),
'',
'FROM',
'    Mecz M',
'JOIN',
'    Klub Gosp ON M.KlubGospID = Gosp.KlubID',
'JOIN',
'    Klub Gosc ON M.KlubGoscID = Gosc.KlubID',
'JOIN',
'    ZdarzenieMecz ZM ON M.MeczID = ZM.MeczID',
'LEFT JOIN',
'    ZdarzenieMeczZmiana ZMZ ON ZM.ZdarzenieMeczID = ZMZ.ZdarzenieMeczID',
'LEFT JOIN',
'    Zawodnik ZawodnikWchodzacy ON ZMZ.ZawodnikWchodzacyID = ZawodnikWchodzacy.ZawodnikID',
'LEFT JOIN',
'    Zawodnik ZawodnikSchodzacy ON ZMZ.ZawodnikSchodzacyID = ZawodnikSchodzacy.ZawodnikID',
'WHERE',
'    M.MeczID = :P32_MECZID',
'    AND ZM.TypZdarzenieMecz = ''Zmiana''',
'',
'ORDER BY',
'    ZM.Minuta;',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167772779964663087)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(305698675209272427)
,p_query_column_id=>1
,p_column_alias=>'ZMIANAID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(305698765757272428)
,p_query_column_id=>2
,p_column_alias=>'MINUTA'
,p_column_display_sequence=>110
,p_column_heading=>'Minuta'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(305698800890272429)
,p_query_column_id=>3
,p_column_alias=>'ZDARZENIEMECZID'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(305698993972272430)
,p_query_column_id=>4
,p_column_alias=>'KLUBGOSPID'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(305699086963272431)
,p_query_column_id=>5
,p_column_alias=>'KLUBGOSCID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(305699138690272432)
,p_query_column_id=>6
,p_column_alias=>'ZAWODNIKWCHODZACYID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(305699298801272433)
,p_query_column_id=>7
,p_column_alias=>'ZAWODNIKSCHODZACYID'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(305699390432272434)
,p_query_column_id=>8
,p_column_alias=>'MECZID'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(305699412162272435)
,p_query_column_id=>9
,p_column_alias=>'SEDZIAGLOWNYID'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(305699513070272436)
,p_query_column_id=>10
,p_column_alias=>'GOSPODARZ_ZMIANY'
,p_column_display_sequence=>100
,p_column_heading=>'Gospodarz zmiany'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(305699603445272437)
,p_query_column_id=>11
,p_column_alias=>'GOSC_ZMIANY'
,p_column_display_sequence=>120
,p_column_heading=>unistr('Go\015B\0107 zmiany')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(305699786368272438)
,p_query_column_id=>12
,p_column_alias=>'EDYTUJ'
,p_column_display_sequence=>130
,p_column_heading=>'Edytuj'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.::P36_MECZID,P36_MINUTA,P36_SEDZIAGLOWNYID,P36_ZDARZENIEMECZID,P36_KLUBGOSCID,P36_KLUBGOSPID,P36_ZAWODNIKSCHODZACY,P36_ZAWODNIKWCHODZACY,P36_ZMIANAID:#MECZID#,#MINUTA#,#SEDZIAGLOWNYID#,#ZDARZENIEMECZID#,#KLUBGOSCID#,'
||'#KLUBGOSPID#,#ZAWODNIKSCHODZACYID#,#ZAWODNIKWCHODZACYID#,#ZMIANAID#'
,p_column_linktext=>'#EDYTUJ#'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(311819060189054110)
,p_name=>'Kartki'
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>80
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlightOff'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ZMK.KartkaID,',
'    ZM.Minuta,',
'    ZMK.ZdarzenieMeczID,',
'    M.KlubGospID,',
'    M.KlubGoscID,',
'    ZMK.ZawodnikKartkowanyID,',
'    M.MeczID,',
'    ZMK.KolorKartki,',
'    M.SedziaGlownyID,',
'    ',
'    CASE',
'        WHEN ZawodnikKartkowany.KlubID = M.KlubGospID ',
'        THEN ZawodnikKartkowany.Nazwisko || '' ('' || ZMK.KolorKartki || '')''',
'        ELSE NULL',
'    END AS Gospodarz_kartki,',
'',
'    CASE',
'        WHEN ZawodnikKartkowany.KlubID = M.KlubGoscID ',
'        THEN ZawodnikKartkowany.Nazwisko || '' ('' || ZMK.KolorKartki || '')''',
'        ELSE NULL',
'    END AS Gosc_kartki,',
unistr('    ''Edytuj kartk\0119'' AS Edytuj'),
'',
'',
'FROM',
'    Mecz M',
'JOIN',
'    Klub Gosp ON M.KlubGospID = Gosp.KlubID',
'JOIN',
'    Klub Gosc ON M.KlubGoscID = Gosc.KlubID',
'JOIN',
'    ZdarzenieMecz ZM ON M.MeczID = ZM.MeczID',
'LEFT JOIN',
'    ZdarzenieMeczKartka ZMK ON ZM.ZdarzenieMeczID = ZMK.ZdarzenieMeczID',
'LEFT JOIN',
'    Zawodnik ZawodnikKartkowany ON ZMK.ZawodnikKartkowanyID = ZawodnikKartkowany.ZawodnikID',
'WHERE',
'    M.MeczID = :P32_MECZID',
'    AND ZM.TypZdarzenieMecz = ''Kartka''',
'',
'ORDER BY',
'    ZM.Minuta;',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167772779964663087)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(311820379369054123)
,p_query_column_id=>1
,p_column_alias=>'KARTKAID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(311820498079054124)
,p_query_column_id=>2
,p_column_alias=>'MINUTA'
,p_column_display_sequence=>110
,p_column_heading=>'Minuta'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(311820594245054125)
,p_query_column_id=>3
,p_column_alias=>'ZDARZENIEMECZID'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(311820649760054126)
,p_query_column_id=>4
,p_column_alias=>'KLUBGOSPID'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(311820745140054127)
,p_query_column_id=>5
,p_column_alias=>'KLUBGOSCID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(311820873499054128)
,p_query_column_id=>6
,p_column_alias=>'ZAWODNIKKARTKOWANYID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(311820953524054129)
,p_query_column_id=>7
,p_column_alias=>'MECZID'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(311821048256054130)
,p_query_column_id=>8
,p_column_alias=>'KOLORKARTKI'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(311821144937054131)
,p_query_column_id=>9
,p_column_alias=>'SEDZIAGLOWNYID'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(311821260540054132)
,p_query_column_id=>10
,p_column_alias=>'GOSPODARZ_KARTKI'
,p_column_display_sequence=>100
,p_column_heading=>'Gospodarz kartki'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(311821391408054133)
,p_query_column_id=>11
,p_column_alias=>'GOSC_KARTKI'
,p_column_display_sequence=>120
,p_column_heading=>unistr('Go\015B\0107 kartki')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(311821408245054134)
,p_query_column_id=>12
,p_column_alias=>'EDYTUJ'
,p_column_display_sequence=>130
,p_column_heading=>'Edytuj'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.::P35_KARTKAID,P35_KLUBGOSPID,P35_KLUBGOSCID,P35_MINUTA,P35_KOLORKARTKI,P35_MECZID,P35_ZAWODNIKKARTKOWANY,P35_ZDARZENIEMECZID:#KARTKAID#,#KLUBGOSPID#,#KLUBGOSCID#,#MINUTA#,#KOLORKARTKI#,#MECZID#,#ZAWODNIKKARTKOWANYID'
||'#,#ZDARZENIEMECZID#'
,p_column_linktext=>'#EDYTUJ#'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(312157541777401616)
,p_name=>'Bramki'
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>60
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlightOff'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ZMG.GOLID,',
'       ZM.MINUTA,',
'       ZMG.ZDARZENIEMECZID,',
'       M.KlubGospID,',
'       M.KlubGoscID,',
'       ZMG.ZAWODNIKSTRZELAJACYID,',
'       M.MeczID,',
'       ZMG.TYPGOLA,',
'       M.SEDZIAGLOWNYID,',
'    CASE ',
'        WHEN ZawodnikStrzelajacy.KlubID = M.KlubGospID ',
'    THEN GOSP.NAZWA',
'        WHEN ZawodnikStrzelajacy.KlubID = M.KlubGoscID ',
'    THEN GOSC.NAZWA',
'        ELSE NULL ',
'    END AS KLUB_GOL,',
'       ',
'    CASE',
'        WHEN ZM.TypZdarzenieMecz = ''Gol'' AND ZawodnikStrzelajacy.KlubID = M.KlubGospID ',
'        THEN ZawodnikStrzelajacy.Nazwisko || '' ('' || ZMG.TypGola || '')''',
'        ELSE NULL',
'    END AS Gospodarz_gole,',
'',
'    SUM(CASE ',
'    WHEN ZM.TypZdarzenieMecz = ''Gol'' AND ',
'         ((ZawodnikStrzelajacy.KlubID = M.KlubGospID AND ZMG.TypGola != ''samoboj'') OR ',
'         (ZawodnikStrzelajacy.KlubID = M.KlubGoscID AND ZMG.TypGola = ''samoboj'')) THEN 1',
'    ELSE 0',
'    END) OVER (ORDER BY ZM.Minuta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) ',
'    || '' - '' || ',
'    SUM(CASE ',
'    WHEN ZM.TypZdarzenieMecz = ''Gol'' AND ',
'         ((ZawodnikStrzelajacy.KlubID = M.KlubGoscID AND ZMG.TypGola != ''samoboj'') OR ',
'         (ZawodnikStrzelajacy.KlubID = M.KlubGospID AND ZMG.TypGola = ''samoboj'')) THEN 1',
'    ELSE 0',
'    END) OVER (ORDER BY ZM.Minuta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Wynik,',
'    CASE',
'        WHEN ZawodnikStrzelajacy.KlubID = M.KlubGoscID ',
'        THEN ZawodnikStrzelajacy.Nazwisko || '' ('' || ZMG.TypGola || '')''',
'        ELSE NULL',
'    END AS Gosc_gole,',
unistr('    ''Edytuj bramk\0119'' AS Edytuj'),
'FROM',
'    Mecz M',
'JOIN',
'    Klub Gosp ON M.KlubGospID = Gosp.KlubID',
'JOIN',
'    Klub Gosc ON M.KlubGoscID = Gosc.KlubID',
'JOIN',
'    ZdarzenieMecz ZM ON M.MeczID = ZM.MeczID',
'LEFT JOIN',
'    ZdarzenieMeczGol ZMG ON ZM.ZdarzenieMeczID = ZMG.ZdarzenieMeczID',
'LEFT JOIN',
'    Zawodnik ZawodnikStrzelajacy ON ZMG.ZawodnikStrzelajacyID = ZawodnikStrzelajacy.ZawodnikID',
'WHERE',
'    M.MeczID = :P32_MECZID',
'    AND ZM.TypZdarzenieMecz = ''Gol''',
'',
'ORDER BY',
'    ZM.Minuta;',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167772779964663087)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312159095309401631)
,p_query_column_id=>1
,p_column_alias=>'GOLID'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312159138254401632)
,p_query_column_id=>2
,p_column_alias=>'MINUTA'
,p_column_display_sequence=>120
,p_column_heading=>'Minuta'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312159207159401633)
,p_query_column_id=>3
,p_column_alias=>'ZDARZENIEMECZID'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312159330579401634)
,p_query_column_id=>4
,p_column_alias=>'KLUBGOSPID'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312159463294401635)
,p_query_column_id=>5
,p_column_alias=>'KLUBGOSCID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312159547046401636)
,p_query_column_id=>6
,p_column_alias=>'ZAWODNIKSTRZELAJACYID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312159622011401637)
,p_query_column_id=>7
,p_column_alias=>'MECZID'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312159795021401638)
,p_query_column_id=>8
,p_column_alias=>'TYPGOLA'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312159823376401639)
,p_query_column_id=>9
,p_column_alias=>'SEDZIAGLOWNYID'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312159957311401640)
,p_query_column_id=>10
,p_column_alias=>'KLUB_GOL'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312160019139401641)
,p_query_column_id=>11
,p_column_alias=>'GOSPODARZ_GOLE'
,p_column_display_sequence=>130
,p_column_heading=>'Gospodarz gole'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312160134888401642)
,p_query_column_id=>12
,p_column_alias=>'WYNIK'
,p_column_display_sequence=>140
,p_column_heading=>'Wynik'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312160279655401643)
,p_query_column_id=>13
,p_column_alias=>'GOSC_GOLE'
,p_column_display_sequence=>150
,p_column_heading=>unistr('Go\015B\0107 gole')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(312160327213401644)
,p_query_column_id=>14
,p_column_alias=>'EDYTUJ'
,p_column_display_sequence=>160
,p_column_heading=>'Edytuj'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.::P92_ZDARZENIEMECZID,P92_MINUTA,P92_KLUBGOSPID,P92_KLUBGOSCID,P92_GOLID,P92_MECZID,P92_STRZELEC,P92_TYPGOLA,P92_SEDZIAGLOWNYID:#ZDARZENIEMECZID#,#MINUTA#,#KLUBGOSPID#,#KLUBGOSCID#,#GOLID#,#MECZID#,#ZAWODNIKSTRZELAJA'
||'CYID#,#TYPGOLA#,#SEDZIAGLOWNYID#'
,p_column_linktext=>'#EDYTUJ#'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(314490636116060747)
,p_name=>unistr('Sk\0142ad podstawowy gospodarze')
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>120
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    SM.SkladMeczowyID,',
'    Z.Nazwisko || '' '' || Z.Imie AS Zawodnik,',
'    SM.RolaWSkladzie,',
'    M.MeczID,',
'    Z.KlubID,',
unistr('    ''Usu\0144'' AS Usu\0144'),
'FROM ',
'    SkladMeczowy SM',
'JOIN ',
'    Zawodnik Z ON SM.ZawodnikID = Z.ZawodnikID',
'JOIN ',
'    Mecz M ON SM.MeczID = M.MeczID',
'WHERE ',
'    SM.RolaWSkladzie = ''P''',
'    AND Z.KlubID = M.KlubGospID',
'    AND M.MeczID = :P32_MECZID',
'ORDER BY ',
'    Z.Nazwisko;'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167772779964663087)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340580767885723518)
,p_query_column_id=>1
,p_column_alias=>'SKLADMECZOWYID'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314490864985060749)
,p_query_column_id=>2
,p_column_alias=>'ZAWODNIK'
,p_column_display_sequence=>20
,p_column_heading=>'Zawodnik'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340579936710723510)
,p_query_column_id=>3
,p_column_alias=>'ROLAWSKLADZIE'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340580024568723511)
,p_query_column_id=>4
,p_column_alias=>'MECZID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340579855863723509)
,p_query_column_id=>5
,p_column_alias=>'KLUBID'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340583986254723550)
,p_query_column_id=>6
,p_column_alias=>unistr('USU\0143')
,p_column_display_sequence=>80
,p_column_heading=>unistr('Usu\0144')
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:32:P32_MECZID,P32_DEL_ID:#MECZID#,#SKLADMECZOWYID#'
,p_column_linktext=>unistr('#USU\0143#')
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(314490938021060750)
,p_name=>unistr('Sk\0142ad podstawowy go\015B\0107')
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>130
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_display_column=>7
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'SELECT ',
'    SM.SkladMeczowyID,',
'    Z.Nazwisko || '' '' || Z.Imie AS Zawodnik,',
'    SM.RolaWSkladzie,',
'    M.MeczID,',
'    Z.KlubID,',
unistr('    ''Usu\0144'' AS Usu\0144'),
'FROM ',
'    SkladMeczowy SM',
'JOIN ',
'    Zawodnik Z ON SM.ZawodnikID = Z.ZawodnikID',
'JOIN ',
'    Mecz M ON SM.MeczID = M.MeczID',
'WHERE ',
'    SM.RolaWSkladzie = ''P''',
'    AND Z.KlubID = M.KlubGoscID',
'    AND M.MeczID = :P32_MECZID',
'ORDER BY ',
'    Z.Nazwisko;'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167772779964663087)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340581136725723522)
,p_query_column_id=>1
,p_column_alias=>'SKLADMECZOWYID'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340579183043723502)
,p_query_column_id=>2
,p_column_alias=>'ZAWODNIK'
,p_column_display_sequence=>20
,p_column_heading=>'Zawodnik'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340581206736723523)
,p_query_column_id=>3
,p_column_alias=>'ROLAWSKLADZIE'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340581368964723524)
,p_query_column_id=>4
,p_column_alias=>'MECZID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340581444201723525)
,p_query_column_id=>5
,p_column_alias=>'KLUBID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340583881033723549)
,p_query_column_id=>6
,p_column_alias=>unistr('USU\0143')
,p_column_display_sequence=>70
,p_column_heading=>unistr('Usu\0144')
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.::P32_MECZID,P32_DEL_ID:#MECZID#,#SKLADMECZOWYID#'
,p_column_linktext=>unistr('#USU\0143#')
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(340579299347723503)
,p_name=>unistr('Sk\0142ad rezerwowy gospodarze')
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>140
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    SM.SkladMeczowyID as SKLADMECZOWYID,',
'    Z.Nazwisko || '' '' || Z.Imie AS Zawodnik,',
'    SM.RolaWSkladzie,',
'    M.MeczID,',
'    Z.KlubID,',
unistr('    ''Usu\0144'' AS Usu\0144'),
'FROM ',
'    SkladMeczowy SM',
'JOIN ',
'    Zawodnik Z ON SM.ZawodnikID = Z.ZawodnikID',
'JOIN ',
'    Mecz M ON SM.MeczID = M.MeczID',
'WHERE ',
'    SM.RolaWSkladzie = ''R''',
'    AND Z.KlubID = M.KlubGospID',
'    AND M.MeczID = :P32_MECZID',
'ORDER BY ',
'    Z.Nazwisko;'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167772779964663087)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340581639315723527)
,p_query_column_id=>1
,p_column_alias=>'SKLADMECZOWYID'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340579497989723505)
,p_query_column_id=>2
,p_column_alias=>'ZAWODNIK'
,p_column_display_sequence=>20
,p_column_heading=>'Zawodnik'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340581745743723528)
,p_query_column_id=>3
,p_column_alias=>'ROLAWSKLADZIE'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340581873450723529)
,p_query_column_id=>4
,p_column_alias=>'MECZID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340581981843723530)
,p_query_column_id=>5
,p_column_alias=>'KLUBID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340582982282723540)
,p_query_column_id=>6
,p_column_alias=>unistr('USU\0143')
,p_column_display_sequence=>70
,p_column_heading=>unistr('Usu\0144')
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:32:P32_MECZID,P32_DEL_ID:#MECZID#,#SKLADMECZOWYID#'
,p_column_linktext=>unistr('#USU\0143#')
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(340579570037723506)
,p_name=>unistr('Sk\0142ad rezerwowy go\015B\0107')
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>150
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'SELECT ',
'    SM.SkladMeczowyID,',
'    Z.Nazwisko || '' '' || Z.Imie AS Zawodnik,',
'    SM.RolaWSkladzie,',
'    M.MeczID,',
'    Z.KlubID,',
unistr('    ''Usu\0144'' AS Usu\0144'),
'FROM ',
'    SkladMeczowy SM',
'JOIN ',
'    Zawodnik Z ON SM.ZawodnikID = Z.ZawodnikID',
'JOIN ',
'    Mecz M ON SM.MeczID = M.MeczID',
'WHERE ',
'    SM.RolaWSkladzie = ''R''',
'    AND Z.KlubID = M.KlubGoscID',
'    AND M.MeczID = :P32_MECZID',
'ORDER BY ',
'    Z.Nazwisko;'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167772779964663087)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340582164626723532)
,p_query_column_id=>1
,p_column_alias=>'SKLADMECZOWYID'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340579748865723508)
,p_query_column_id=>2
,p_column_alias=>'ZAWODNIK'
,p_column_display_sequence=>20
,p_column_heading=>'Zawodnik'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340582261755723533)
,p_query_column_id=>3
,p_column_alias=>'ROLAWSKLADZIE'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340582369353723534)
,p_query_column_id=>4
,p_column_alias=>'MECZID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(340582474208723535)
,p_query_column_id=>5
,p_column_alias=>'KLUBID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459716451087818401)
,p_query_column_id=>6
,p_column_alias=>unistr('USU\0143')
,p_column_display_sequence=>70
,p_column_heading=>unistr('Usu\0144')
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.::P32_MECZID,P32_DEL_ID:#MECZID#,#SKLADMECZOWYID#'
,p_column_linktext=>unistr('#USU\0143#')
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(311818952024054109)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(304837330505072946)
,p_button_name=>'Dodaj_zmiane'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Dodaj zmian\0119')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.::P36_MECZID:&P32_MECZID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(311821526541054135)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(311819060189054110)
,p_button_name=>'Dodaj_kartke'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Dodaj kartk\0119')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.::P35_MECZID:&P32_MECZID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(312160476673401645)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(312157541777401616)
,p_button_name=>'Doda_bramke'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Dodaj bramk\0119')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.::P92_MECZID:&P32_MECZID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(340580235401723513)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(314490636116060747)
,p_button_name=>'Dodaj_podst_gosp'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj zawodnika'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.::P37_MECZID,P37_ROLAWSKLADZIE,P37_KLUB:&P32_MECZID.,P,Gospodarz'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(340582687841723537)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(314490938021060750)
,p_button_name=>'Dodaj_podst_gosc'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj zawodnika'
,p_button_position=>'EDIT'
,p_button_redirect_url=>unistr('f?p=&APP_ID.:37:&SESSION.::&DEBUG.::P37_MECZID,P37_KLUB,P37_ROLAWSKLADZIE:&P32_MECZID.,Go\015B\0107,P')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(340582764798723538)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(340579299347723503)
,p_button_name=>'Dodaj_rez_gosp'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj zawodnika'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.::P37_MECZID,P37_KLUB,P37_ROLAWSKLADZIE:&P32_MECZID.,Gospodarz,R'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(340582839989723539)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(340579570037723506)
,p_button_name=>'Dodaj_rez_gosc'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj zawodnika'
,p_button_position=>'EDIT'
,p_button_redirect_url=>unistr('f?p=&APP_ID.:37:&SESSION.::&DEBUG.::P37_MECZID,P37_KLUB,P37_ROLAWSKLADZIE:&P32_MECZID.,Go\015B\0107,R')
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(175000900927992447)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(174974190929992408)
,p_button_name=>'EDIT'
,p_button_static_id=>'edit_master_btn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Edytuj mecz'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:RP,41:P38_MECZID:&P32_MECZID.'
,p_icon_css_classes=>'fa-pencil-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174968013837992386)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(174967280352992384)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(167808026046663116)
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&APP_SESSION.:RESET:&DEBUG.:RP,32::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174968490724992386)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(174967280352992384)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(167808026046663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj mecz'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:RP,41::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(174969243761992387)
,p_name=>'P32_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(174968720452992386)
,p_prompt=>'Search'
,p_placeholder=>'Search...'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(167805116832663113)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large:t-Form-fieldContainer--postTextBlock'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(174984256523992419)
,p_name=>'P32_MECZID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(174974190929992408)
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(340583676440723547)
,p_name=>'P32_DEL_ID'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(340579299347723503)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(175001216404992447)
,p_name=>'Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(174974190929992408)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(175001895228992448)
,p_event_id=>wwv_flow_imp.id(175001216404992447)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(174974190929992408)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(175002323795992448)
,p_event_id=>wwv_flow_imp.id(175001216404992447)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Mecz2 row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(175001397155992447)
,p_name=>'Perform Search'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P32_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(175003161186992449)
,p_event_id=>wwv_flow_imp.id(175001397155992447)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(174969573964992387)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(175003619478992449)
,p_event_id=>wwv_flow_imp.id(175001397155992447)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(340583769513723548)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P32_DEL_ID IS NOT NULL THEN',
'   DELETE FROM SkladMeczowy',
'    WHERE SkladMeczowyID = :P32_DEL_ID;',
'   COMMIT;',
'    :P32_DEL_ID := NULL;',
'',
'END IF;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>340583769513723548
);
wwv_flow_imp.component_end;
end;
/
