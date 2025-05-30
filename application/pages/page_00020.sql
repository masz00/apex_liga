prompt --application/pages/page_00020
begin
--   Manifest
--     PAGE: 00020
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
 p_id=>20
,p_name=>'Tabela wstydu'
,p_alias=>'STATYSTYKI'
,p_step_title=>'Statystyki'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(183740118561431862)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(183740859052431863)
,p_name=>'Tabela wstydu'
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_grid_column_span=>8
,p_display_column=>1
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH Zawodnicy AS (',
'    SELECT Z.ZawodnikID,',
'           Z.Imie || '' '' || Z.Nazwisko AS PelneImie,',
'           K.NAZWA AS Klub,',
'           ObliczZolteKartki(Z.ZawodnikID) AS ZolteKartki,',
'           ObliczCzerwoneKartki(Z.ZawodnikID) AS CzerwoneKartki',
'    FROM Zawodnik Z',
'    JOIN Klub K ON K.KlubID = Z.KlubID',
')',
'SELECT *',
'FROM (',
'    SELECT ZawodnikID,',
'           PelneImie,',
'           Klub,',
'           ZolteKartki,',
'           CzerwoneKartki,',
'           (ZolteKartki + CzerwoneKartki) AS SumaKartek,',
'           ROW_NUMBER() OVER (ORDER BY (ZolteKartki + CzerwoneKartki) DESC, CzerwoneKartki DESC) AS RN',
'    FROM Zawodnicy',
')',
'WHERE RN <= 10;',
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
 p_id=>wwv_flow_imp.id(314488717220060728)
,p_query_column_id=>1
,p_column_alias=>'ZAWODNIKID'
,p_column_display_sequence=>10
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314488879427060729)
,p_query_column_id=>2
,p_column_alias=>'PELNEIMIE'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Imi\0119 i nazwisko')
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314489373033060734)
,p_query_column_id=>3
,p_column_alias=>'KLUB'
,p_column_display_sequence=>40
,p_column_heading=>'Klub'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314489039151060731)
,p_query_column_id=>4
,p_column_alias=>'ZOLTEKARTKI'
,p_column_display_sequence=>50
,p_column_heading=>unistr('\017B\00F3\0142te kartki')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314489103199060732)
,p_query_column_id=>5
,p_column_alias=>'CZERWONEKARTKI'
,p_column_display_sequence=>60
,p_column_heading=>'Czerwone kartki'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314489513385060736)
,p_query_column_id=>6
,p_column_alias=>'SUMAKARTEK'
,p_column_display_sequence=>70
,p_column_heading=>'Suma kartek'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314489498604060735)
,p_query_column_id=>7
,p_column_alias=>'RN'
,p_column_display_sequence=>20
,p_column_heading=>'Nr'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp.component_end;
end;
/
