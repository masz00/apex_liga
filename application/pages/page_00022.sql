prompt --application/pages/page_00022
begin
--   Manifest
--     PAGE: 00022
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
 p_id=>22
,p_name=>'Najlepsi strzelcy'
,p_alias=>'NAJLEPSI-STRZELCY'
,p_step_title=>'Najlepsi strzelcy'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(287240806560515881)
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
 p_id=>wwv_flow_imp.id(287241554240515882)
,p_name=>'Najlepsi strzelcy'
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-headingLevel-6:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_grid_column_span=>8
,p_display_column=>1
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT *',
'FROM (',
'    SELECT Z.ZawodnikID,',
'           Z.Imie || '' '' || Z.Nazwisko AS Imie_i_nazwisko,',
'           K.NAZWA AS Klub,',
'           ObliczLiczbeGoli(Z.ZawodnikID) AS LiczbaGoli,',
'           ROW_NUMBER() OVER (ORDER BY ObliczLiczbeGoli(Z.ZawodnikID) DESC) AS RN',
'    FROM Zawodnik Z',
'    JOIN Klub K ON K.KlubID = Z.KlubID',
')',
'WHERE RN <= 10;',
''))
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
 p_id=>wwv_flow_imp.id(287241975635515883)
,p_query_column_id=>1
,p_column_alias=>'ZAWODNIKID'
,p_column_display_sequence=>1
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314488465011060725)
,p_query_column_id=>2
,p_column_alias=>'IMIE_I_NAZWISKO'
,p_column_display_sequence=>21
,p_column_heading=>unistr('Imi\0119 i nazwisko')
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314488565654060726)
,p_query_column_id=>3
,p_column_alias=>'KLUB'
,p_column_display_sequence=>31
,p_column_heading=>'Klub'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(287243178171515884)
,p_query_column_id=>4
,p_column_alias=>'LICZBAGOLI'
,p_column_display_sequence=>41
,p_column_heading=>'Liczba goli'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314488629009060727)
,p_query_column_id=>5
,p_column_alias=>'RN'
,p_column_display_sequence=>11
,p_column_heading=>'Nr'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp.component_end;
end;
/
