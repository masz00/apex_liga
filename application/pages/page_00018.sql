prompt --application/pages/page_00018
begin
--   Manifest
--     PAGE: 00018
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
 p_id=>18
,p_name=>'Tabela'
,p_alias=>'TABELA'
,p_step_title=>'Tabela'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(310981589572226920)
,p_name=>'Tabela'
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select POZYCJA,',
'       KLUB,',
'       WYGRANE,',
'       REMISY,',
'       PRZEGRANE,',
'       BRAMKI_ZDOBYTE,',
'       BRAMKI_STRACONE,',
'       ROZNICA_BRAMEK,',
'       PUNKTY',
'  from LIGATABELA',
'order by pozycja'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167772779964663087)
,p_query_num_rows=>50
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_prn_format=>'PDF'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(305699942422272440)
,p_query_column_id=>1
,p_column_alias=>'POZYCJA'
,p_column_display_sequence=>10
,p_column_heading=>'Pozycja'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(310981988280226923)
,p_query_column_id=>2
,p_column_alias=>'KLUB'
,p_column_display_sequence=>20
,p_column_heading=>'Klub'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(310982352231226924)
,p_query_column_id=>3
,p_column_alias=>'WYGRANE'
,p_column_display_sequence=>30
,p_column_heading=>'Wygrane'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(310982776976226925)
,p_query_column_id=>4
,p_column_alias=>'REMISY'
,p_column_display_sequence=>40
,p_column_heading=>'Remisy'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(310983135077226925)
,p_query_column_id=>5
,p_column_alias=>'PRZEGRANE'
,p_column_display_sequence=>50
,p_column_heading=>'Przegrane'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(310983524557226926)
,p_query_column_id=>6
,p_column_alias=>'BRAMKI_ZDOBYTE'
,p_column_display_sequence=>60
,p_column_heading=>'Bramki zdobyte'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(310983992576226926)
,p_query_column_id=>7
,p_column_alias=>'BRAMKI_STRACONE'
,p_column_display_sequence=>70
,p_column_heading=>'Bramki stracone'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(310984311192226926)
,p_query_column_id=>8
,p_column_alias=>'ROZNICA_BRAMEK'
,p_column_display_sequence=>80
,p_column_heading=>unistr('R\00F3\017Cnica bramek')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(310984710537226927)
,p_query_column_id=>9
,p_column_alias=>'PUNKTY'
,p_column_display_sequence=>90
,p_column_heading=>'Punkty'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(314489652305060737)
,p_plug_name=>'Breadcrumb'
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
wwv_flow_imp.component_end;
end;
/
