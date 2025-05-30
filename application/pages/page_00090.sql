prompt --application/pages/page_00090
begin
--   Manifest
--     PAGE: 00090
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
 p_id=>90
,p_name=>'Mecz'
,p_alias=>'MECZ2'
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
 p_id=>wwv_flow_imp.id(196141890445289726)
,p_plug_name=>'Bramki'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167724540842663045)
,p_plug_display_sequence=>60
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
'    M.MeczID = :P90_MECZID',
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
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(196143774436289745)
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
,p_internal_uid=>196143774436289745
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196143801530289746)
,p_db_column_name=>'GOLID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Golid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196143960927289747)
,p_db_column_name=>'MINUTA'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Minuta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196144075696289748)
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
 p_id=>wwv_flow_imp.id(196144196223289749)
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
 p_id=>wwv_flow_imp.id(196144231614289750)
,p_db_column_name=>'GOSPODARZ_GOLE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Gospodarz Gole'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219343768402448001)
,p_db_column_name=>'WYNIK'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Wynik'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219343891765448002)
,p_db_column_name=>'GOSC_GOLE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Gosc Gole'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219344309977448007)
,p_db_column_name=>'KLUBGOSPID'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Klubgospid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219344495943448008)
,p_db_column_name=>'KLUBGOSCID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Klubgoscid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(219346952473448033)
,p_db_column_name=>'MECZID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Meczid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(284036288528077009)
,p_db_column_name=>'TYPGOLA'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Typgola'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(284037672023077023)
,p_db_column_name=>'SEDZIAGLOWNYID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Sedziaglownyid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(219418580167500738)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'2194186'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'GOLID:MINUTA:ZDARZENIEMECZID:ZAWODNIKSTRZELAJACYID:GOSPODARZ_GOLE:WYNIK:GOSC_GOLE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(219345027152448014)
,p_plug_name=>'Mecz'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167746708932663065)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(167631056795662963)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(167809543388663118)
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(219347828613448042)
,p_name=>'Kartki'
,p_template=>wwv_flow_imp.id(167724540842663045)
,p_display_sequence=>70
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
unistr('    M.MeczID AS "MeczID", -- Ukryte, do u\017Cycia w formularzu'),
unistr('    M.KlubGospID AS "KlubID_Gosp", -- Ukryte, do list dru\017Cyn w formularzu'),
unistr('    M.KlubGoscID AS "KlubID_Gosc", -- Ukryte, do list dru\017Cyn w formularzu'),
unistr('    ZMK.ZawodnikKartkowanyID AS "ZawodnikID", -- Ukryte, do powi\0105zania z zawodnikami'),
unistr('    ZMK.KolorKartki AS "TypKartki", -- Ukryte, do ustawienia domy\015Blnego wyboru kartki w formularzu'),
'',
'    -- Widoczne kolumny w raporcie:',
'    CASE ',
'        WHEN Z.KlubID = M.KlubGospID THEN K.Nazwa',
'    END AS Gospodarz_Nazwa,',
'    CASE ',
'        WHEN Z.KlubID = M.KlubGoscID THEN K.Nazwa',
'    END AS Gosc_Nazwa,',
'    CASE ',
'        WHEN Z.KlubID = M.KlubGospID THEN Z.Imie || '' '' || Z.Nazwisko || '' ('' || ZMK.KolorKartki || '')''',
'    END AS Gospodarz_Kartki,',
'    CASE ',
'        WHEN Z.KlubID = M.KlubGoscID THEN Z.Imie || '' '' || Z.Nazwisko || '' ('' || ZMK.KolorKartki || '')''',
'    END AS Gosc_Kartki,',
'    ZM.Minuta AS Minuta',
'FROM ',
'    ZdarzenieMecz ZM',
'JOIN ',
'    ZdarzenieMeczKartka ZMK ON ZM.ZdarzenieMeczID = ZMK.ZdarzenieMeczID',
'JOIN ',
'    Zawodnik Z ON ZMK.ZawodnikKartkowanyID = Z.ZawodnikID',
'JOIN ',
'    Mecz M ON ZM.MeczID = M.MeczID',
'JOIN ',
'    Klub K ON Z.KlubID = K.KlubID',
'WHERE ',
'    ZM.MeczID = :P90_MECZID',
'ORDER BY ',
'    ZM.Minuta;',
''))
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
 p_id=>wwv_flow_imp.id(248180767096521205)
,p_query_column_id=>1
,p_column_alias=>'MeczID'
,p_column_display_sequence=>10
,p_column_heading=>'Meczid'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(248180897110521206)
,p_query_column_id=>2
,p_column_alias=>'KlubID_Gosp'
,p_column_display_sequence=>20
,p_column_heading=>'Klubid Gosp'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(248180969561521207)
,p_query_column_id=>3
,p_column_alias=>'KlubID_Gosc'
,p_column_display_sequence=>30
,p_column_heading=>'Klubid Gosc'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(248181064879521208)
,p_query_column_id=>4
,p_column_alias=>'ZawodnikID'
,p_column_display_sequence=>40
,p_column_heading=>'Zawodnikid'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(248181159985521209)
,p_query_column_id=>5
,p_column_alias=>'TypKartki'
,p_column_display_sequence=>50
,p_column_heading=>'Typkartki'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(248181211467521210)
,p_query_column_id=>6
,p_column_alias=>'GOSPODARZ_NAZWA'
,p_column_display_sequence=>60
,p_column_heading=>'Gospodarz Nazwa'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(248181367594521211)
,p_query_column_id=>7
,p_column_alias=>'GOSC_NAZWA'
,p_column_display_sequence=>70
,p_column_heading=>'Gosc Nazwa'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(248181476643521212)
,p_query_column_id=>8
,p_column_alias=>'GOSPODARZ_KARTKI'
,p_column_display_sequence=>80
,p_column_heading=>'Gospodarz Kartki'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(248181574185521213)
,p_query_column_id=>9
,p_column_alias=>'GOSC_KARTKI'
,p_column_display_sequence=>90
,p_column_heading=>'Gosc Kartki'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(248181678118521214)
,p_query_column_id=>10
,p_column_alias=>'MINUTA'
,p_column_display_sequence=>100
,p_column_heading=>'Minuta'
,p_use_as_row_header=>'N'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(365934177785465560)
,p_plug_name=>'Search'
,p_region_css_classes=>'search-region padding-md'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(365935031297465561)
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
'    apex_page.get_url(p_items => ''P90_MECZID'', p_values => M.MeczID) AS LINK,',
'    null AS ICON_CLASS,',
'    null AS LINK_ATTR,',
'    null AS ICON_COLOR_CLASS,',
'    case ',
'        when coalesce(:P90_MECZID, ''0'') = M.MeczID then ''is-active'' ',
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
'    (:P90_SEARCH IS NULL',
'     OR upper(Gosp.Nazwa) LIKE ''%'' || upper(:P90_SEARCH) || ''%''',
'     OR upper(Gosc.Nazwa) LIKE ''%'' || upper(:P90_SEARCH) || ''%'')',
'ORDER BY ',
'    M.DataMeczu;',
''))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P90_SEARCH'
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
 p_id=>wwv_flow_imp.id(190972738623473199)
,p_query_column_id=>1
,p_column_alias=>'MECZID'
,p_column_display_sequence=>1
,p_column_heading=>'MECZID'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(190973131339473201)
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
 p_id=>wwv_flow_imp.id(190973505866473201)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>3
,p_column_heading=>'LINK'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(190973969856473202)
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
 p_id=>wwv_flow_imp.id(190974303675473202)
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
 p_id=>wwv_flow_imp.id(190974769798473203)
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
 p_id=>wwv_flow_imp.id(190975147124473203)
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
 p_id=>wwv_flow_imp.id(190975519598473204)
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
 p_id=>wwv_flow_imp.id(190975983722473205)
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
 p_id=>wwv_flow_imp.id(190972328277473199)
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
 p_id=>wwv_flow_imp.id(365939648262465582)
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
'    M.MeczID = :P90_MECZID',
'ORDER BY ',
'    M.DataMeczu;',
''))
,p_display_when_condition=>'P90_MECZID'
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
 p_id=>wwv_flow_imp.id(190978790935473209)
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
'and "MECZID" = :P90_MECZID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(190979164094473209)
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
 p_id=>wwv_flow_imp.id(190979530314473210)
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
 p_id=>wwv_flow_imp.id(190979918171473210)
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
 p_id=>wwv_flow_imp.id(190976703813473207)
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
 p_id=>wwv_flow_imp.id(190977108946473208)
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
 p_id=>wwv_flow_imp.id(190977550369473208)
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
 p_id=>wwv_flow_imp.id(190977932338473208)
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
 p_id=>wwv_flow_imp.id(190978372405473209)
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
 p_id=>wwv_flow_imp.id(365949960840465594)
,p_plug_name=>'Region Display Selector'
,p_region_template_options=>'#DEFAULT#:margin-bottom-md'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_location=>null
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_query_num_rows=>15
,p_plug_customized=>'1'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(365950401188465594)
,p_plug_name=>'Zdarzenia  meczowe'
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167724540842663045)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ZM.ZdarzenieMeczID,',
'    ZMZ.ZmianaID,',
'    ZMK.KartkaID,',
'    ZMG.GOLID,',
'    ZM.Minuta,',
'',
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
'        THEN ZawodnikStrzelajacy.Nazwisko || '' ('' || ZMG.TypGola || '')''',
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
'        THEN ZawodnikStrzelajacy.Nazwisko || '' ('' || ZMG.TypGola || '')''',
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
'    ZdarzenieMeczGol ZMG ON ZM.ZdarzenieMeczID = ZMG.ZdarzenieMeczID',
'LEFT JOIN',
'    Zawodnik ZawodnikStrzelajacy ON ZMG.ZawodnikStrzelajacyID = ZawodnikStrzelajacy.ZawodnikID',
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
'    M.MeczID = :P90_MECZID -- Filtr dla konkretnego meczu',
'',
'ORDER BY',
'    ZM.Minuta;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P90_MECZID'
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
 p_id=>wwv_flow_imp.id(197000810891156610)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.::P33_ZDARZENIEMECZID:#ZDARZENIEMECZID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'MACIEJ.SZYMANIAK@STUDENT.PUT.POZNAN.PL'
,p_internal_uid=>197000810891156610
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197000918032156611)
,p_db_column_name=>'MINUTA'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Minuta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197001007232156612)
,p_db_column_name=>'GOSPODARZ_ZMIANY'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Gospodarz Zmiany'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197001151589156613)
,p_db_column_name=>'GOSPODARZ_KARTKI'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Gospodarz Kartki'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197001251593156614)
,p_db_column_name=>'GOSPODARZ_GOLE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Gospodarz Gole'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197001388832156615)
,p_db_column_name=>'WYNIK'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Wynik'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197001473881156616)
,p_db_column_name=>unistr('GO\015A\0106_GOLE')
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>unistr('Go\015B\0107 Gole')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197001571393156617)
,p_db_column_name=>unistr('GO\015A\0106_KARTKI')
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Go\015B\0107 Kartki')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197001679547156618)
,p_db_column_name=>unistr('GO\015A\0106_ZMIANY')
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Go\015B\0107 Zmiany')
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197154780032389131)
,p_db_column_name=>'ZDARZENIEMECZID'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Zdarzeniemeczid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197154883837389132)
,p_db_column_name=>'ZMIANAID'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Zmianaid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197154913631389133)
,p_db_column_name=>'KARTKAID'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Kartkaid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(197155028255389134)
,p_db_column_name=>'GOLID'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Golid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(197039803757169020)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1970399'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>unistr('GOLID:KARTKAID:ZDARZENIEMECZID:ZMIANAID:MINUTA:GOSPODARZ_ZMIANY:GOSPODARZ_KARTKI:GOSPODARZ_GOLE:WYNIK:GO\015A\0106_GOLE:GO\015A\0106_KARTKI:GO\015A\0106_ZMIANY:')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(365965926702465620)
,p_plug_name=>'No Record Selected'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>50
,p_location=>null
,p_plug_source=>'No Record Selected'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P90_MECZID'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(366031807177971676)
,p_name=>unistr('Sk\0142ady')
,p_template=>wwv_flow_imp.id(167724540842663045)
,p_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_css_classes=>'js-detail-region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_new_grid_row=>false
,p_new_grid_column=>false
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
'     WHERE M.MeczID = :P90_MECZID',
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
'     WHERE M.MeczID = :P90_MECZID',
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
'     WHERE M.MeczID = :P90_MECZID',
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
'     WHERE M.MeczID = :P90_MECZID',
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
,p_display_when_condition=>'P90_MECZID'
,p_display_condition_type=>'ITEM_IS_NOT_NULL'
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
 p_id=>wwv_flow_imp.id(197152725004389111)
,p_query_column_id=>1
,p_column_alias=>'GOSPODARZ_PODSTAWOWY'
,p_column_display_sequence=>10
,p_column_heading=>'Gospodarz Podstawowy'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(197152857795389112)
,p_query_column_id=>2
,p_column_alias=>'GOSPODARZ_REZERWOWY'
,p_column_display_sequence=>20
,p_column_heading=>'Gospodarz Rezerwowy'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(197152971018389113)
,p_query_column_id=>3
,p_column_alias=>unistr('GO\015A\0106_PODSTAWOWY')
,p_column_display_sequence=>30
,p_column_heading=>unistr('Go\015B\0107 Podstawowy')
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(197153072441389114)
,p_query_column_id=>4
,p_column_alias=>unistr('GO\015A\0106_REZERWOWY')
,p_column_display_sequence=>40
,p_column_heading=>unistr('Go\015B\0107 Rezerwowy')
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(190970899212473196)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(365950401188465594)
,p_button_name=>'POP_ZDARZENIEMECZ'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(167807290726663115)
,p_button_image_alt=>'Add Mecz2DEtails'
,p_button_redirect_url=>'f?p=&APP_ID.:42:&APP_SESSION.::&DEBUG.:RP,42:P42_MECZID:&P90_MECZID.'
,p_icon_css_classes=>'fa-plus'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(248180608607521204)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(219347828613448042)
,p_button_name=>'EDIT_1'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(167808026046663116)
,p_button_image_alt=>'Dodaj'
,p_button_redirect_url=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,41:P23_KARTKAID:P90_KARTKAID'
,p_icon_css_classes=>'fa-pencil-square-o'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(191048147490528031)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(366031807177971676)
,p_button_name=>'Dodaj'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807290726663115)
,p_button_image_alt=>'Dodaj'
,p_button_position=>'EDIT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(190980356559473211)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(365939648262465582)
,p_button_name=>'EDIT'
,p_button_static_id=>'edit_master_btn'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(167808026046663116)
,p_button_image_alt=>'Edytuj'
,p_button_position=>'EDIT'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,41:P7_MECZID:&P90_MECZID.'
,p_icon_css_classes=>'fa-pencil-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(190966563945473181)
,p_button_sequence=>10
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI:t-Button--iconLeft:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(167808026046663116)
,p_button_image_alt=>'Reset'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:90:&APP_SESSION.:RESET:&DEBUG.:RP,32::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(190966939819473184)
,p_button_sequence=>20
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(167808026046663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Utw\00F3rz')
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:RP,41::'
,p_icon_css_classes=>'fa-plus'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(284037419700077021)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(196141890445289726)
,p_button_name=>'Dodaj_bramke'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_image_alt=>'Dodaj Bramke'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.::P92_MECZID,P92_SEDZIAGLOWNYID:&P90_MECZID.,&P90_SEDZIAGLOWNYID#SEDZIAGLOWNYID#'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365940933293465584)
,p_name=>'P90_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(365934177785465560)
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
 p_id=>wwv_flow_imp.id(365964973242465630)
,p_name=>'P90_MECZID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(365939648262465582)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(190984930325473226)
,p_name=>'Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(365939648262465582)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190985405471473228)
,p_event_id=>wwv_flow_imp.id(190984930325473226)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(365939648262465582)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190985996271473229)
,p_event_id=>wwv_flow_imp.id(190984930325473226)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Mecz2 row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(190986344657473229)
,p_name=>'Dialog Closed'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(365950401188465594)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190986817606473229)
,p_event_id=>wwv_flow_imp.id(190986344657473229)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(365950401188465594)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190987387728473230)
,p_event_id=>wwv_flow_imp.id(190986344657473229)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Mecz2DEtails row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(190987763451473230)
,p_name=>'Perform Search'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P90_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190988200930473231)
,p_event_id=>wwv_flow_imp.id(190987763451473230)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(365935031297465561)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(190988763941473231)
,p_event_id=>wwv_flow_imp.id(190987763451473230)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp.component_end;
end;
/
