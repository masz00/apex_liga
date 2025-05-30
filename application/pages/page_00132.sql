prompt --application/pages/page_00132
begin
--   Manifest
--     PAGE: 00132
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
 p_id=>132
,p_name=>'Mecz'
,p_alias=>'MECZ3'
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
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(488575999798774032)
,p_plug_name=>'Search'
,p_region_name=>'IR_MECZ_SEARCH'
,p_region_css_classes=>'search-region padding-md'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(488576853310774033)
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
'    apex_page.get_url(p_items => ''P132_MECZID'', p_values => M.MeczID) AS LINK,',
'    null AS ICON_CLASS,',
'    null AS LINK_ATTR,',
'    null AS ICON_COLOR_CLASS,',
'    case ',
'        when coalesce(:P132_MECZID, ''0'') = M.MeczID then ''is-active'' ',
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
'    (:P132_SEARCH IS NULL',
'     OR upper(Gosp.Nazwa) LIKE ''%'' || upper(:P132_SEARCH) || ''%''',
'     OR upper(Gosc.Nazwa) LIKE ''%'' || upper(:P132_SEARCH) || ''%'')',
'ORDER BY ',
'    M.DataMeczu;',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P132_SEARCH'
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
 p_id=>wwv_flow_imp.id(313616115377781680)
,p_query_column_id=>1
,p_column_alias=>'MECZID'
,p_column_display_sequence=>1
,p_column_heading=>'MECZID'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313616524501781681)
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
 p_id=>wwv_flow_imp.id(313616965800781681)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>3
,p_column_heading=>'LINK'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313617328507781681)
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
 p_id=>wwv_flow_imp.id(313617754349781682)
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
 p_id=>wwv_flow_imp.id(313618125721781682)
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
 p_id=>wwv_flow_imp.id(313618590090781683)
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
 p_id=>wwv_flow_imp.id(313618978145781683)
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
 p_id=>wwv_flow_imp.id(313619331590781683)
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
 p_id=>wwv_flow_imp.id(313615747298781680)
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
 p_id=>wwv_flow_imp.id(488581470275774054)
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
'    M.MeczID = :P132_MECZID',
'ORDER BY ',
'    M.DataMeczu;',
''))
,p_display_when_condition=>'P132_MECZID'
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
 p_id=>wwv_flow_imp.id(313622188992781686)
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
'and "MECZID" = :P132_MECZID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313622569638781687)
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
 p_id=>wwv_flow_imp.id(313622901409781687)
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
 p_id=>wwv_flow_imp.id(313623321815781688)
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
 p_id=>wwv_flow_imp.id(313620182518781684)
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
 p_id=>wwv_flow_imp.id(313620527040781685)
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
 p_id=>wwv_flow_imp.id(313620921505781685)
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
 p_id=>wwv_flow_imp.id(313621355247781686)
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
 p_id=>wwv_flow_imp.id(313621797940781686)
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
 p_id=>wwv_flow_imp.id(488591782853774066)
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
,p_plug_display_when_condition=>'P132_MECZID'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(488592223201774066)
,p_name=>'Zdarzenia  meczowe'
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>30
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody:t-Form--labelsAbove'
,p_component_template_options=>'t-Report--stretch:#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ZM.Minuta,',
'',
'    -- Gospodarz - Zmiany',
'    CASE',
'        WHEN ZM.TypZdarzenieMecz = ''Zmiana'' AND ZawodnikSchodzacy.KlubID = M.KlubGospID ',
'        THEN ZawodnikSchodzacy.Nazwisko || '' -> '' || ZawodnikWchodzacy.Nazwisko',
'        ELSE NULL',
'    END AS Gospodarz_zmiany,',
'',
'    -- Gospodarz - Kartki',
'    CASE',
'        WHEN ZM.TypZdarzenieMecz = ''Kartka'' AND ZawodnikKartkowany.KlubID = M.KlubGospID ',
'        THEN ZawodnikKartkowany.Nazwisko || '' ('' || ZMK.KolorKartki || '')''',
'        ELSE NULL',
'    END AS Gospodarz_kartki,',
'',
'    -- Gospodarz - Gole',
'    CASE',
'        WHEN ZM.TypZdarzenieMecz = ''Gol'' AND ZawodnikStrzelajacy.KlubID = M.KlubGospID ',
'        THEN ZawodnikStrzelajacy.Nazwisko || '' ('' || ZG.TypGola || '')''',
'        ELSE NULL',
'    END AS Gospodarz_gole,',
'',
unistr('    -- Wynik (dynamiczny, na \015Brodku)'),
'    SUM(CASE ',
'        WHEN ZM.TypZdarzenieMecz = ''Gol'' AND ZawodnikStrzelajacy.KlubID = M.KlubGospID THEN 1',
'        ELSE 0',
'    END) OVER (ORDER BY ZM.Minuta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) ',
'    || '' - '' || ',
'    SUM(CASE ',
'        WHEN ZM.TypZdarzenieMecz = ''Gol'' AND ZawodnikStrzelajacy.KlubID = M.KlubGoscID THEN 1',
'        ELSE 0',
'    END) OVER (ORDER BY ZM.Minuta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Wynik,',
'',
unistr('    -- Go\015B\0107 - Gole'),
'    CASE',
'        WHEN ZM.TypZdarzenieMecz = ''Gol'' AND ZawodnikStrzelajacy.KlubID = M.KlubGoscID ',
'        THEN ZawodnikStrzelajacy.Nazwisko || '' ('' || ZG.TypGola || '')''',
'        ELSE NULL',
unistr('    END AS Go\015B\0107_gole,'),
'',
unistr('    -- Go\015B\0107 - Kartki'),
'    CASE',
'        WHEN ZM.TypZdarzenieMecz = ''Kartka'' AND ZawodnikKartkowany.KlubID = M.KlubGoscID ',
'        THEN ZawodnikKartkowany.Nazwisko || '' ('' || ZMK.KolorKartki || '')''',
'        ELSE NULL',
unistr('    END AS Go\015B\0107_kartki,'),
'',
unistr('    -- Go\015B\0107 - Zmiany'),
'    CASE',
'        WHEN ZM.TypZdarzenieMecz = ''Zmiana'' AND ZawodnikSchodzacy.KlubID = M.KlubGoscID ',
'        THEN ZawodnikSchodzacy.Nazwisko || '' -> '' || ZawodnikWchodzacy.Nazwisko',
'        ELSE NULL',
unistr('    END AS Go\015B\0107_zmiany'),
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
'    ZdarzenieMeczGol ZG ON ZM.ZdarzenieMeczID = ZG.ZdarzenieMeczID',
'LEFT JOIN',
'    Zawodnik ZawodnikStrzelajacy ON ZG.ZawodnikStrzelajacyID = ZawodnikStrzelajacy.ZawodnikID',
'LEFT JOIN',
'    ZdarzenieMeczKartka ZMK ON ZM.ZdarzenieMeczID = ZMK.ZdarzenieMeczID',
'LEFT JOIN',
'    Zawodnik ZawodnikKartkowany ON ZMK.ZawodnikKartkowanyID = ZawodnikKartkowany.ZawodnikID',
'LEFT JOIN',
'    ZdarzenieMeczZmiana ZMZ ON ZM.ZdarzenieMeczID = ZMZ.ZdarzenieMeczID',
'LEFT JOIN',
'    Zawodnik ZawodnikSchodzacy ON ZMZ.ZawodnikSchodzacyID = ZawodnikSchodzacy.ZawodnikID',
'LEFT JOIN',
'    Zawodnik ZawodnikWchodzacy ON ZMZ.ZawodnikWchodzacyID = ZawodnikWchodzacy.ZawodnikID',
'',
'WHERE',
'    M.MeczID = :P132_MECZID -- Filtr dla konkretnego meczu',
'',
'ORDER BY',
'    ZM.Minuta;',
''))
,p_display_when_condition=>'P132_MECZID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167772779964663087)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313611036996781672)
,p_query_column_id=>1
,p_column_alias=>'MINUTA'
,p_column_display_sequence=>4
,p_column_heading=>'Minuta'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313611436112781672)
,p_query_column_id=>2
,p_column_alias=>'GOSPODARZ_ZMIANY'
,p_column_display_sequence=>84
,p_column_heading=>'Gospodarz Zmiany'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313611899209781673)
,p_query_column_id=>3
,p_column_alias=>'GOSPODARZ_KARTKI'
,p_column_display_sequence=>94
,p_column_heading=>'Gospodarz Kartki'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313613459248781674)
,p_query_column_id=>4
,p_column_alias=>'GOSPODARZ_GOLE'
,p_column_display_sequence=>104
,p_column_heading=>'Gospodarz Gole'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313613815438781675)
,p_query_column_id=>5
,p_column_alias=>'WYNIK'
,p_column_display_sequence=>114
,p_column_heading=>'Wynik'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313612282676781673)
,p_query_column_id=>6
,p_column_alias=>unistr('GO\015A\0106_GOLE')
,p_column_display_sequence=>124
,p_column_heading=>unistr('Go\015B\0107 Gole')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313612699136781673)
,p_query_column_id=>7
,p_column_alias=>unistr('GO\015A\0106_KARTKI')
,p_column_display_sequence=>134
,p_column_heading=>unistr('Go\015B\0107 Kartki')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313613027397781674)
,p_query_column_id=>8
,p_column_alias=>unistr('GO\015A\0106_ZMIANY')
,p_column_display_sequence=>144
,p_column_heading=>unistr('Go\015B\0107 Zmiany')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(597645736789858677)
,p_plug_name=>'Kartki'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167724540842663045)
,p_plug_display_sequence=>70
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'    END AS Gosc_kartki',
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
'    M.MeczID = :P132_MECZID',
'    AND ZM.TypZdarzenieMecz = ''Kartka''',
'',
'ORDER BY',
'    ZM.Minuta;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(597645789519858678)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.::P35_KARTKAID,P35_KLUBGOSPID,P35_KLUBGOSCID,P35_MINUTA,P35_KOLORKARTKI,P35_MECZID,P35_ZAWODNIKKARTKOWANY,P35_ZDARZENIEMECZID:#KARTKAID#,#KLUBGOSPID#,#KLUBGOSCID#,#MINUTA#,#KOLORKARTKI#,#MECZID#,#ZAWODNIKKARTKOWANYID'
||'#,#ZDARZENIEMECZID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'MACIEJ.SZYMANIAK@STUDENT.PUT.POZNAN.PL'
,p_internal_uid=>597645789519858678
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597646511685858685)
,p_db_column_name=>'MECZID'
,p_display_order=>10
,p_column_identifier=>'G'
,p_column_label=>'Meczid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597645888566858679)
,p_db_column_name=>'KARTKAID'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Kartkaid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597646134173858681)
,p_db_column_name=>'ZDARZENIEMECZID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Zdarzeniemeczid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597646470746858684)
,p_db_column_name=>'ZAWODNIKKARTKOWANYID'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Zawodnikkartkowanyid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597646192922858682)
,p_db_column_name=>'KLUBGOSPID'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Klubgospid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597646327046858683)
,p_db_column_name=>'KLUBGOSCID'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Klubgoscid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597646813664858688)
,p_db_column_name=>'GOSPODARZ_KARTKI'
,p_display_order=>70
,p_column_identifier=>'J'
,p_column_label=>'Gospodarz kartki'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597646078504858680)
,p_db_column_name=>'MINUTA'
,p_display_order=>80
,p_column_identifier=>'B'
,p_column_label=>'Minuta'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597646944571858689)
,p_db_column_name=>'GOSC_KARTKI'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>unistr('Go\015B\0107 kartki')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597646635267858686)
,p_db_column_name=>'KOLORKARTKI'
,p_display_order=>110
,p_column_identifier=>'H'
,p_column_label=>'Kolorkartki'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597646768277858687)
,p_db_column_name=>'SEDZIAGLOWNYID'
,p_display_order=>120
,p_column_identifier=>'I'
,p_column_label=>'Sedziaglownyid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(617327953476818812)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3037207'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'GOSPODARZ_KARTKI:MINUTA:GOSC_KARTKI:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(597647172355858691)
,p_plug_name=>'Zmiany'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h1'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167696451163663023)
,p_plug_display_sequence=>90
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'    END AS Gosc_zmiany',
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
'    M.MeczID = :P132_MECZID',
'    AND ZM.TypZdarzenieMecz = ''Zmiana''',
'',
'ORDER BY',
'    ZM.Minuta;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(597647231137858692)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.::P36_KLUBGOSCID,P36_KLUBGOSPID,P36_MECZID,P36_MINUTA,P36_SEDZIAGLOWNYID,P36_ZAWODNIKSCHODZACY,P36_ZAWODNIKWCHODZACY,P36_ZDARZENIEMECZID,P36_ZMIANAID:#KLUBGOSPID#,#KLUBGOSCID#,#MECZID#,#MINUTA#,#SEDZIAGLOWNYID#,#ZAWO'
||'DNIKSCHODZACYID#,#ZAWODNIKWCHODZACYID#,#ZDARZENIEMECZID#,#ZMIANAID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'MACIEJ.SZYMANIAK@STUDENT.PUT.POZNAN.PL'
,p_internal_uid=>597647231137858692
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597647369915858693)
,p_db_column_name=>'ZMIANAID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Zmianaid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597647535395858695)
,p_db_column_name=>'ZDARZENIEMECZID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Zdarzeniemeczid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(618440249567854548)
,p_db_column_name=>'ZAWODNIKWCHODZACYID'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Zawodnikwchodzacyid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(618440318717854549)
,p_db_column_name=>'ZAWODNIKSCHODZACYID'
,p_display_order=>50
,p_column_identifier=>'G'
,p_column_label=>'Zawodnikschodzacyid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(618440658399854552)
,p_db_column_name=>'GOSPODARZ_ZMIANY'
,p_display_order=>60
,p_column_identifier=>'J'
,p_column_label=>'Gospodarz zmiany'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(618440763655854553)
,p_db_column_name=>'GOSC_ZMIANY'
,p_display_order=>70
,p_column_identifier=>'K'
,p_column_label=>'Gosc zmiany'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597647476166858694)
,p_db_column_name=>'MINUTA'
,p_display_order=>80
,p_column_identifier=>'B'
,p_column_label=>'Minuta'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(618440456138854550)
,p_db_column_name=>'MECZID'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'Meczid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(618440480683854551)
,p_db_column_name=>'SEDZIAGLOWNYID'
,p_display_order=>130
,p_column_identifier=>'I'
,p_column_label=>'Sedziaglownyid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(618486667106867637)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'3048794'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'GOSPODARZ_ZMIANY:MINUTA:GOSC_ZMIANY'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(618444609850854592)
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
'    M.MeczID = :P132_MECZID',
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
 p_id=>wwv_flow_imp.id(313641599578781725)
,p_query_column_id=>1
,p_column_alias=>'ZMIANAID'
,p_column_display_sequence=>10
,p_column_heading=>'Zmianaid'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313641966933781726)
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
 p_id=>wwv_flow_imp.id(313642311009781726)
,p_query_column_id=>3
,p_column_alias=>'ZDARZENIEMECZID'
,p_column_display_sequence=>30
,p_column_heading=>'Zdarzeniemeczid'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313642755559781726)
,p_query_column_id=>4
,p_column_alias=>'KLUBGOSPID'
,p_column_display_sequence=>40
,p_column_heading=>'Klubgospid'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313643181218781727)
,p_query_column_id=>5
,p_column_alias=>'KLUBGOSCID'
,p_column_display_sequence=>50
,p_column_heading=>'Klubgoscid'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313643519636781727)
,p_query_column_id=>6
,p_column_alias=>'ZAWODNIKWCHODZACYID'
,p_column_display_sequence=>60
,p_column_heading=>'Zawodnikwchodzacyid'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313643950164781728)
,p_query_column_id=>7
,p_column_alias=>'ZAWODNIKSCHODZACYID'
,p_column_display_sequence=>70
,p_column_heading=>'Zawodnikschodzacyid'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313644305430781728)
,p_query_column_id=>8
,p_column_alias=>'MECZID'
,p_column_display_sequence=>80
,p_column_heading=>'Meczid'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313644760368781729)
,p_query_column_id=>9
,p_column_alias=>'SEDZIAGLOWNYID'
,p_column_display_sequence=>90
,p_column_heading=>'Sedziaglownyid'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313645117769781729)
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
 p_id=>wwv_flow_imp.id(313645565697781729)
,p_query_column_id=>11
,p_column_alias=>'GOSC_ZMIANY'
,p_column_display_sequence=>120
,p_column_heading=>'Gosc zmiany'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313645936868781730)
,p_query_column_id=>12
,p_column_alias=>'EDYTUJ'
,p_column_display_sequence=>130
,p_column_heading=>'Edytuj'
,p_use_as_row_header=>'N'
,p_column_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.::P36_MECZID,P36_KLUBGOSPID,P36_KLUBGOSCID,P36_MINUTA,P36_SEDZIAGLOWNYID,P36_ZAWODNIKSCHODZACY,P36_ZAWODNIKWCHODZACY,P36_ZMIANAID,P36_ZDARZENIEMECZID:#MECZID#,#KLUBGOSPID#,#KLUBGOSCID#,#MINUTA#,#SEDZIAGLOWNYID#,#ZAWO'
||'DNIKSCHODZACYID#,#ZAWODNIKWCHODZACYID#,#ZMIANAID#,#ZDARZENIEMECZID#'
,p_column_linktext=>'#EDYTUJ#'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(619307300469054087)
,p_name=>unistr('Sk\0142ady')
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>110
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'t-Report--stretch:#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight:t-Report--inline'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    NVL(Gospodarz_Podstawowy.Zawodnik, '''') AS Gospodarz_Podstawowy,',
'    NVL(Gospodarz_Rezerwowy.Zawodnik, '''') AS Gospodarz_Rezerwowy,',
unistr('    NVL(Go\015B\0107_Podstawowy.Zawodnik, '''') AS Go\015B\0107_Podstawowy,'),
unistr('    NVL(Go\015B\0107_Rezerwowy.Zawodnik, '''') AS Go\015B\0107_Rezerwowy'),
'FROM ',
unistr('    -- Gospodarz - Podstawowy sk\0142ad'),
'    (SELECT ',
'         Z.Nazwisko || '' '' || Z.Imie AS Zawodnik,',
'         ROW_NUMBER() OVER (ORDER BY Z.Nazwisko) AS Rn',
'     FROM SkladMeczowy SM',
'     JOIN Zawodnik Z ON SM.ZawodnikID = Z.ZawodnikID',
'     JOIN Mecz M ON SM.MeczID = M.MeczID',
'     WHERE M.MeczID = :P132_MECZID',
'       AND SM.RolaWSkladzie = ''P''',
'       AND Z.KlubID = M.KlubGospID',
'    ) Gospodarz_Podstawowy',
'FULL OUTER JOIN',
unistr('    -- Gospodarz - Rezerwowy sk\0142ad'),
'    (SELECT ',
'         Z.Nazwisko || '' '' || Z.Imie AS Zawodnik,',
'         ROW_NUMBER() OVER (ORDER BY Z.Nazwisko) AS Rn',
'     FROM SkladMeczowy SM',
'     JOIN Zawodnik Z ON SM.ZawodnikID = Z.ZawodnikID',
'     JOIN Mecz M ON SM.MeczID = M.MeczID',
'     WHERE M.MeczID = :P132_MECZID',
'       AND SM.RolaWSkladzie = ''R''',
'       AND Z.KlubID = M.KlubGospID',
'    ) Gospodarz_Rezerwowy',
'ON Gospodarz_Podstawowy.Rn = Gospodarz_Rezerwowy.Rn',
'FULL OUTER JOIN',
unistr('    -- Go\015B\0107 - Podstawowy sk\0142ad'),
'    (SELECT ',
'         Z.Nazwisko || '' '' || Z.Imie AS Zawodnik,',
'         ROW_NUMBER() OVER (ORDER BY Z.Nazwisko) AS Rn',
'     FROM SkladMeczowy SM',
'     JOIN Zawodnik Z ON SM.ZawodnikID = Z.ZawodnikID',
'     JOIN Mecz M ON SM.MeczID = M.MeczID',
'     WHERE M.MeczID = :P132_MECZID',
'       AND SM.RolaWSkladzie = ''P''',
'       AND Z.KlubID = M.KlubGoscID',
unistr('    ) Go\015B\0107_Podstawowy'),
unistr('ON Gospodarz_Podstawowy.Rn = Go\015B\0107_Podstawowy.Rn'),
'FULL OUTER JOIN',
unistr('    -- Go\015B\0107 - Rezerwowy sk\0142ad'),
'    (SELECT ',
'         Z.Nazwisko || '' '' || Z.Imie AS Zawodnik,',
'         ROW_NUMBER() OVER (ORDER BY Z.Nazwisko) AS Rn',
'     FROM SkladMeczowy SM',
'     JOIN Zawodnik Z ON SM.ZawodnikID = Z.ZawodnikID',
'     JOIN Mecz M ON SM.MeczID = M.MeczID',
'     WHERE M.MeczID = :P132_MECZID',
'       AND SM.RolaWSkladzie = ''R''',
'       AND Z.KlubID = M.KlubGoscID',
unistr('    ) Go\015B\0107_Rezerwowy'),
unistr('ON Gospodarz_Podstawowy.Rn = Go\015B\0107_Rezerwowy.Rn'),
'ORDER BY ',
'    COALESCE(Gospodarz_Podstawowy.Rn, ',
'             Gospodarz_Rezerwowy.Rn, ',
unistr('             Go\015B\0107_Podstawowy.Rn, '),
unistr('             Go\015B\0107_Rezerwowy.Rn);'),
''))
,p_display_when_condition=>'P132_MECZID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167772779964663087)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data found.'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>5000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313607800130781657)
,p_query_column_id=>1
,p_column_alias=>'GOSPODARZ_PODSTAWOWY'
,p_column_display_sequence=>10
,p_column_heading=>'Gospodarz Podstawowy'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313608214183781659)
,p_query_column_id=>2
,p_column_alias=>'GOSPODARZ_REZERWOWY'
,p_column_display_sequence=>20
,p_column_heading=>'Gospodarz Rezerwowy'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313608635837781659)
,p_query_column_id=>3
,p_column_alias=>unistr('GO\015A\0106_PODSTAWOWY')
,p_column_display_sequence=>30
,p_column_heading=>unistr('Go\015B\0107 Podstawowy')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313609037504781660)
,p_query_column_id=>4
,p_column_alias=>unistr('GO\015A\0106_REZERWOWY')
,p_column_display_sequence=>40
,p_column_heading=>unistr('Go\015B\0107 Rezerwowy')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(625426339534835756)
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
'    M.MeczID = :P132_MECZID',
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
 p_id=>wwv_flow_imp.id(313651216878781737)
,p_query_column_id=>1
,p_column_alias=>'KARTKAID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313651693220781738)
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
 p_id=>wwv_flow_imp.id(313652048203781738)
,p_query_column_id=>3
,p_column_alias=>'ZDARZENIEMECZID'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313652447286781738)
,p_query_column_id=>4
,p_column_alias=>'KLUBGOSPID'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313652841007781739)
,p_query_column_id=>5
,p_column_alias=>'KLUBGOSCID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313653284020781739)
,p_query_column_id=>6
,p_column_alias=>'ZAWODNIKKARTKOWANYID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313653646945781740)
,p_query_column_id=>7
,p_column_alias=>'MECZID'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313654001868781740)
,p_query_column_id=>8
,p_column_alias=>'KOLORKARTKI'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313654431204781740)
,p_query_column_id=>9
,p_column_alias=>'SEDZIAGLOWNYID'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313654800830781741)
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
 p_id=>wwv_flow_imp.id(313655260574781741)
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
 p_id=>wwv_flow_imp.id(313655693581781741)
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
 p_id=>wwv_flow_imp.id(625764821123183262)
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
'        WHEN ZM.TypZdarzenieMecz = ''Gol'' AND ZawodnikStrzelajacy.KlubID = M.KlubGospID THEN 1',
'        ELSE 0',
'    END) OVER (ORDER BY ZM.Minuta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) ',
'    || '' - '' || ',
'    SUM(CASE ',
'        WHEN ZM.TypZdarzenieMecz = ''Gol'' AND ZawodnikStrzelajacy.KlubID = M.KlubGoscID THEN 1',
'        ELSE 0',
'    END) OVER (ORDER BY ZM.Minuta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Wynik,',
'    CASE',
'        WHEN ZawodnikStrzelajacy.KlubID = M.KlubGoscID ',
'        THEN ZawodnikStrzelajacy.Nazwisko || '' ('' || ZMG.TypGola || '')''',
'        ELSE NULL',
'    END AS Gosc_gole,',
unistr('    ''Edytuj bramk\0119'' AS Edytuj'),
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
'    ZdarzenieMeczGol ZMG ON ZM.ZdarzenieMeczID = ZMG.ZdarzenieMeczID',
'LEFT JOIN',
'    Zawodnik ZawodnikStrzelajacy ON ZMG.ZawodnikStrzelajacyID = ZawodnikStrzelajacy.ZawodnikID',
'WHERE',
'    M.MeczID = :P132_MECZID',
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
 p_id=>wwv_flow_imp.id(313629823217781708)
,p_query_column_id=>1
,p_column_alias=>'GOLID'
,p_column_display_sequence=>110
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313630251870781709)
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
 p_id=>wwv_flow_imp.id(313630603455781709)
,p_query_column_id=>3
,p_column_alias=>'ZDARZENIEMECZID'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313631086524781710)
,p_query_column_id=>4
,p_column_alias=>'KLUBGOSPID'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313631459363781710)
,p_query_column_id=>5
,p_column_alias=>'KLUBGOSCID'
,p_column_display_sequence=>50
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313631818443781711)
,p_query_column_id=>6
,p_column_alias=>'ZAWODNIKSTRZELAJACYID'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313632260890781711)
,p_query_column_id=>7
,p_column_alias=>'MECZID'
,p_column_display_sequence=>70
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313632616593781711)
,p_query_column_id=>8
,p_column_alias=>'TYPGOLA'
,p_column_display_sequence=>80
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313633058246781712)
,p_query_column_id=>9
,p_column_alias=>'SEDZIAGLOWNYID'
,p_column_display_sequence=>90
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313633474577781712)
,p_query_column_id=>10
,p_column_alias=>'KLUB_GOL'
,p_column_display_sequence=>100
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313633824157781713)
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
 p_id=>wwv_flow_imp.id(313634287656781713)
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
 p_id=>wwv_flow_imp.id(313634691470781713)
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
 p_id=>wwv_flow_imp.id(313635063982781714)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(811494341359839417)
,p_plug_name=>'Bramki'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167724540842663045)
,p_plug_display_sequence=>50
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'        WHEN ZM.TypZdarzenieMecz = ''Gol'' AND ZawodnikStrzelajacy.KlubID = M.KlubGospID THEN 1',
'        ELSE 0',
'    END) OVER (ORDER BY ZM.Minuta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) ',
'    || '' - '' || ',
'    SUM(CASE ',
'        WHEN ZM.TypZdarzenieMecz = ''Gol'' AND ZawodnikStrzelajacy.KlubID = M.KlubGoscID THEN 1',
'        ELSE 0',
'    END) OVER (ORDER BY ZM.Minuta ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS Wynik,',
'    CASE',
'        WHEN ZawodnikStrzelajacy.KlubID = M.KlubGoscID ',
'        THEN ZawodnikStrzelajacy.Nazwisko || '' ('' || ZMG.TypGola || '')''',
'        ELSE NULL',
'    END AS Gosc_gole',
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
'    ZdarzenieMeczGol ZMG ON ZM.ZdarzenieMeczID = ZMG.ZdarzenieMeczID',
'LEFT JOIN',
'    Zawodnik ZawodnikStrzelajacy ON ZMG.ZawodnikStrzelajacyID = ZawodnikStrzelajacy.ZawodnikID',
'WHERE',
'    M.MeczID = :P132_MECZID',
'    AND ZM.TypZdarzenieMecz = ''Gol''',
'',
'ORDER BY',
'    ZM.Minuta;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(811496225350839436)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.::P92_ZDARZENIEMECZID,P92_MINUTA,P92_KLUBGOSCID,P92_KLUBGOSPID,P92_GOLID,P92_MECZID,P92_STRZELEC,P92_TYPGOLA,P92_SEDZIAGLOWNYID:#ZDARZENIEMECZID#,#MINUTA#,#KLUBGOSCID#,#KLUBGOSPID#,#GOLID#,#MECZID#,#ZAWODNIKSTRZELAJA'
||'CYID#,#TYPGOLA#,#SEDZIAGLOWNYID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'MACIEJ.SZYMANIAK@STUDENT.PUT.POZNAN.PL'
,p_internal_uid=>811496225350839436
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(834699403387997724)
,p_db_column_name=>'MECZID'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Meczid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(811496252444839437)
,p_db_column_name=>'GOLID'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Golid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(811496526610839439)
,p_db_column_name=>'ZDARZENIEMECZID'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Zdarzeniemeczid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(811496647137839440)
,p_db_column_name=>'ZAWODNIKSTRZELAJACYID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Zawodnikstrzelajacyid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(834696760891997698)
,p_db_column_name=>'KLUBGOSPID'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Klubgospid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(834696946857997699)
,p_db_column_name=>'KLUBGOSCID'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Klubgoscid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(811496411841839438)
,p_db_column_name=>'MINUTA'
,p_display_order=>90
,p_column_identifier=>'B'
,p_column_label=>'Minuta'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(811496682528839441)
,p_db_column_name=>'GOSPODARZ_GOLE'
,p_display_order=>100
,p_column_identifier=>'E'
,p_column_label=>'Gospodarz gole'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(834696219316997692)
,p_db_column_name=>'WYNIK'
,p_display_order=>110
,p_column_identifier=>'F'
,p_column_label=>'Wynik'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(834696342679997693)
,p_db_column_name=>'GOSC_GOLE'
,p_display_order=>120
,p_column_identifier=>'G'
,p_column_label=>unistr('Go\015B\0107 gole')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(899388739442626700)
,p_db_column_name=>'TYPGOLA'
,p_display_order=>140
,p_column_identifier=>'K'
,p_column_label=>'Typgola'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(618442334505854569)
,p_db_column_name=>'KLUB_GOL'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Klub Gol'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(899390122937626714)
,p_db_column_name=>'SEDZIAGLOWNYID'
,p_display_order=>160
,p_column_identifier=>'L'
,p_column_label=>'Sedziaglownyid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(834771031082050429)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2194186'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MINUTA:GOSPODARZ_GOLE:WYNIK:GOSC_GOLE:'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313614221704781676)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(488592223201774066)
,p_button_name=>'POP_ZDARZENIEMECZ'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_image_alt=>'Dodaj zdarzenie'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RR,2:P25_DATA_MECZU:&P25_DATA_MECZU.'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313635402336781714)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(625764821123183262)
,p_button_name=>'Doda_bramke'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Doda bramk\0119')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.::P92_MECZID:&P132_MECZID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313646376294781730)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(618444609850854592)
,p_button_name=>'Dodaj_zmiane'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Dodaj zmian\0119')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.::P36_MECZID:&P132_MECZID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313656021675781742)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(625426339534835756)
,p_button_name=>'Dodaj_kartke'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Dodaj kartk\0119')
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.::P35_MECZID:&P132_MECZID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313623754791781688)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(488581470275774054)
,p_button_name=>'EDIT'
,p_button_static_id=>'edit_master_btn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(167808026046663116)
,p_button_image_alt=>'Edytuj'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:RP,41:P38_MECZID:&P132_MECZID.'
,p_icon_css_classes=>'fa-pencil-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313609814715781669)
,p_button_sequence=>10
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(167808026046663116)
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:132:&APP_SESSION.:RESET:&DEBUG.:RP,32::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313610272315781670)
,p_button_sequence=>20
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313629051097781707)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(597645736789858677)
,p_button_name=>unistr('Dodaj_kartk\0119')
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Dodaj kartk\0119')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.::P35_MECZID:&P132_MECZID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313640744542781724)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(811494341359839417)
,p_button_name=>unistr('Dodaj_bramk\0119')
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Dodaj bramk\0119')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.::P92_MECZID:&P132_MECZID.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(313650432607781736)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(597647172355858691)
,p_button_name=>unistr('Dodaj_zmian\0119')
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Dodaj zmian\0119')
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.::P36_MECZID:&P132_MECZID.'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(488584279861774064)
,p_name=>'P132_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(488575999798774032)
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(488608357260774108)
,p_name=>'P132_MECZID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(488581470275774054)
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(313657508241781752)
,p_name=>'Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(488581470275774054)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(313658095103781754)
,p_event_id=>wwv_flow_imp.id(313657508241781752)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(488581470275774054)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(313658551749781755)
,p_event_id=>wwv_flow_imp.id(313657508241781752)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Mecz2 row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(313658928135781755)
,p_name=>'Dialog Closed'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(488592223201774066)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(313659400556781756)
,p_event_id=>wwv_flow_imp.id(313658928135781755)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(488592223201774066)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(313659958690781760)
,p_event_id=>wwv_flow_imp.id(313658928135781755)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Mecz2DEtails row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(313660382477781760)
,p_name=>'Perform Search'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P132_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(313660828460781761)
,p_event_id=>wwv_flow_imp.id(313660382477781760)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(488576853310774033)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(313661339664781761)
,p_event_id=>wwv_flow_imp.id(313660382477781760)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp.component_end;
end;
/
