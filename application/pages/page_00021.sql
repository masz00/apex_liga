prompt --application/pages/page_00021
begin
--   Manifest
--     PAGE: 00021
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
 p_id=>21
,p_name=>'Tabele'
,p_alias=>'TABELE'
,p_step_title=>'Tabele'
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
,p_page_component_map=>'13'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(459716583460818402)
,p_name=>'Tabela'
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>80
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
'FROM LIGATABELA ',
'WHERE LigaID = :P21_LIGAID',
'ORDER BY POZYCJA'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167772779964663087)
,p_query_num_rows=>20
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Nie znaleziono danych'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459716608337818403)
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
 p_id=>wwv_flow_imp.id(459716708791818404)
,p_query_column_id=>2
,p_column_alias=>'KLUB'
,p_column_display_sequence=>20
,p_column_heading=>'Klub'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459716863222818405)
,p_query_column_id=>3
,p_column_alias=>'WYGRANE'
,p_column_display_sequence=>30
,p_column_heading=>unistr('Zwyci\0119stwa')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459716994550818406)
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
 p_id=>wwv_flow_imp.id(459717071307818407)
,p_query_column_id=>5
,p_column_alias=>'PRZEGRANE'
,p_column_display_sequence=>50
,p_column_heading=>unistr('Pora\017Cki')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459717109658818408)
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
 p_id=>wwv_flow_imp.id(459717209778818409)
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
 p_id=>wwv_flow_imp.id(459717393780818410)
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
 p_id=>wwv_flow_imp.id(459717488341818411)
,p_query_column_id=>9
,p_column_alias=>'PUNKTY'
,p_column_display_sequence=>90
,p_column_heading=>'Punkty'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(459717513832818412)
,p_name=>unistr('Najwi\0119ksi kartkowicze')
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>110
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH Zawodnicy AS (',
'    SELECT Z.ZawodnikID,',
'           Z.Imie || '' '' || Z.Nazwisko AS PelneImie,',
'           K.Nazwa AS Klub,',
'           ObliczZolteKartki2(Z.ZawodnikID, :P21_LIGAID)    AS ZolteKartki,',
'           ObliczCzerwoneKartki2(Z.ZawodnikID, :P21_LIGAID) AS CzerwoneKartki',
'    FROM Zawodnik Z',
'         JOIN Klub K ON K.KlubID = Z.KlubID',
'    WHERE K.LigaID = :P21_LIGAID ',
')',
'SELECT *',
'FROM (',
'    SELECT ',
'       ZawodnikID,',
'       PelneImie,',
'       Klub,',
'       ZolteKartki,',
'       CzerwoneKartki,',
'       (ZolteKartki + CzerwoneKartki) AS SumaKartek,',
'       ROW_NUMBER() OVER (',
'          ORDER BY (ZolteKartki + CzerwoneKartki) DESC, ',
'                   CzerwoneKartki DESC',
'       ) AS RN',
'    FROM Zawodnicy',
')',
'WHERE RN <= 10;',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167772779964663087)
,p_query_num_rows=>20
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Nie znaleziono danych'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459718512020818422)
,p_query_column_id=>1
,p_column_alias=>'ZAWODNIKID'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459718677255818423)
,p_query_column_id=>2
,p_column_alias=>'PELNEIMIE'
,p_column_display_sequence=>20
,p_column_heading=>unistr('Imi\0119 i nazwisko')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459717799277818414)
,p_query_column_id=>3
,p_column_alias=>'KLUB'
,p_column_display_sequence=>30
,p_column_heading=>'Klub'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459718781654818424)
,p_query_column_id=>4
,p_column_alias=>'ZOLTEKARTKI'
,p_column_display_sequence=>60
,p_column_heading=>unistr('\017B\00F3\0142te kartki')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459718805025818425)
,p_query_column_id=>5
,p_column_alias=>'CZERWONEKARTKI'
,p_column_display_sequence=>70
,p_column_heading=>'Czerwone kartki'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459718955935818426)
,p_query_column_id=>6
,p_column_alias=>'SUMAKARTEK'
,p_column_display_sequence=>80
,p_column_heading=>'Suma kartek'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459719053208818427)
,p_query_column_id=>7
,p_column_alias=>'RN'
,p_column_display_sequence=>10
,p_column_heading=>'Pozycja'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(459719199964818428)
,p_name=>'Najlepsi strzelcy'
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>90
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH Strzelcy AS (',
'    SELECT',
'        Z.ZawodnikID,',
'        Z.Imie || '' '' || Z.Nazwisko AS Imie_i_nazwisko,',
'        K.Nazwa AS Klub,',
unistr('        -- u\017Cywamy nowej funkcji z parametrem :Pxx_LIGAID'),
'        ObliczLiczbeGoli2(Z.ZawodnikID, :P21_LIGAID) AS LiczbaGoli',
'    FROM Zawodnik Z',
'         JOIN Klub K ON Z.KlubID = K.KlubID',
'    WHERE K.LigaID = :P21_LIGAID',
')',
'SELECT *',
'FROM (',
'    SELECT',
'        ZawodnikID,',
'        Imie_i_nazwisko,',
'        Klub,',
'        LiczbaGoli,',
'        ROW_NUMBER() OVER (ORDER BY LiczbaGoli DESC) AS RN',
'    FROM Strzelcy',
')',
'WHERE RN <= 10;',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(167772779964663087)
,p_query_num_rows=>20
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Nie znaleziono danych'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459719318251818430)
,p_query_column_id=>1
,p_column_alias=>'ZAWODNIKID'
,p_column_display_sequence=>40
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459719908574818436)
,p_query_column_id=>2
,p_column_alias=>'IMIE_I_NAZWISKO'
,p_column_display_sequence=>20
,p_column_heading=>unistr('Imi\0119  i nazwisko')
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459719233870818429)
,p_query_column_id=>3
,p_column_alias=>'KLUB'
,p_column_display_sequence=>30
,p_column_heading=>'Klub'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459720091596818437)
,p_query_column_id=>4
,p_column_alias=>'LICZBAGOLI'
,p_column_display_sequence=>60
,p_column_heading=>'Liczba goli'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459719860734818435)
,p_query_column_id=>5
,p_column_alias=>'RN'
,p_column_display_sequence=>10
,p_column_heading=>'Pozycja'
,p_use_as_row_header=>'N'
,p_column_alignment=>'CENTER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(459781392276859861)
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
 p_id=>wwv_flow_imp.id(459782828986859864)
,p_plug_name=>'Search'
,p_region_css_classes=>'search-region padding-md'
,p_region_template_options=>'#DEFAULT#:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(459783684670859867)
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
'select "LIGAID",',
'    null LINK_CLASS,',
'    apex_page.get_url(p_items => ''P21_LIGAID'', p_values => "LIGAID") LINK,',
'    null ICON_CLASS,',
'    null LINK_ATTR,',
'    null ICON_COLOR_CLASS,',
'    case when coalesce(:P21_LIGAID,''0'') = "LIGAID"',
'      then ''is-active'' ',
'      else '' ''',
'    end LIST_CLASS,',
'    (substr("NAZWALIGI", 1, 50)||( case when length("NAZWALIGI") > 50 then ''...'' else '''' end )) LIST_TITLE,',
'    (substr("SEZON", 1, 50)||( case when length("SEZON") > 50 then ''...'' else '''' end )) LIST_TEXT,',
'    null LIST_BADGE',
'from "LIGA" x',
'where (:P21_SEARCH is null',
'        or upper(x."NAZWALIGI") like ''%''||upper(:P21_SEARCH)||''%''',
'        or upper(x."SEZON") like ''%''||upper(:P21_SEARCH)||''%''',
'    )',
'order by "NAZWALIGI"'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P21_SEARCH'
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
 p_id=>wwv_flow_imp.id(459784356809859875)
,p_query_column_id=>1
,p_column_alias=>'LIGAID'
,p_column_display_sequence=>1
,p_column_heading=>'LIGAID'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459784768367859875)
,p_query_column_id=>2
,p_column_alias=>'LINK_CLASS'
,p_column_display_sequence=>2
,p_column_heading=>'LINK_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459785195443859876)
,p_query_column_id=>3
,p_column_alias=>'LINK'
,p_column_display_sequence=>3
,p_column_heading=>'LINK'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459785556931859876)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>4
,p_column_heading=>'ICON_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459785909477859876)
,p_query_column_id=>5
,p_column_alias=>'LINK_ATTR'
,p_column_display_sequence=>5
,p_column_heading=>'LINK_ATTR'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459786376799859877)
,p_query_column_id=>6
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>6
,p_column_heading=>'ICON_COLOR_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459786709182859877)
,p_query_column_id=>7
,p_column_alias=>'LIST_CLASS'
,p_column_display_sequence=>7
,p_column_heading=>'LIST_CLASS'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459787169071859878)
,p_query_column_id=>8
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>8
,p_column_heading=>'LIST_TITLE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459787557647859879)
,p_query_column_id=>9
,p_column_alias=>'LIST_TEXT'
,p_column_display_sequence=>9
,p_column_heading=>'LIST_TEXT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459787968587859879)
,p_query_column_id=>10
,p_column_alias=>'LIST_BADGE'
,p_column_display_sequence=>10
,p_column_heading=>'LIST_BADGE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(459788305573859910)
,p_name=>'Liga'
,p_template=>wwv_flow_imp.id(167734399364663053)
,p_display_sequence=>10
,p_region_css_classes=>'js-master-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'TABLE'
,p_query_table=>'LIGA'
,p_query_where=>'"LIGAID" = :P21_LIGAID'
,p_include_rowid_column=>false
,p_display_when_condition=>'P21_LIGAID'
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
 p_id=>wwv_flow_imp.id(459788996478859912)
,p_query_column_id=>1
,p_column_alias=>'LIGAID'
,p_column_display_sequence=>1
,p_column_heading=>'Ligaid'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "LIGA"',
'where "LIGAID" is not null',
'and "LIGAID" = :P21_LIGAID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459789386737859912)
,p_query_column_id=>2
,p_column_alias=>'NAZWALIGI'
,p_column_display_sequence=>2
,p_column_heading=>'Nazwa ligi'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "LIGA"',
'where "NAZWALIGI" is not null',
'and "LIGAID" = :P21_LIGAID'))
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459789793623859913)
,p_query_column_id=>3
,p_column_alias=>'KRAJ'
,p_column_display_sequence=>3
,p_column_heading=>'Kraj'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "LIGA"',
'where "KRAJ" is not null',
'and "LIGAID" = :P21_LIGAID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(459790173729859913)
,p_query_column_id=>4
,p_column_alias=>'SEZON'
,p_column_display_sequence=>4
,p_column_heading=>'Sezon'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXISTS'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from "LIGA"',
'where "SEZON" is not null',
'and "LIGAID" = :P21_LIGAID'))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(459793689274859925)
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
,p_plug_display_when_condition=>'P21_LIGAID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(459813636458860023)
,p_plug_name=>'No Record Selected'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>70
,p_plug_source=>'No Record Selected'
,p_plug_display_condition_type=>'ITEM_IS_NULL'
,p_plug_display_when_condition=>'P21_LIGAID'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(459783346832859867)
,p_name=>'P21_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(459782828986859864)
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
 p_id=>wwv_flow_imp.id(459793318489859924)
,p_name=>'P21_LIGAID'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(459788305573859910)
,p_display_as=>'NATIVE_HIDDEN'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(459814492731860024)
,p_name=>'Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(459788305573859910)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(459815045826860025)
,p_event_id=>wwv_flow_imp.id(459814492731860024)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(459788305573859910)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(459815569765860025)
,p_event_id=>wwv_flow_imp.id(459814492731860024)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Liga row(s) updated.'');'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(459814566547860024)
,p_name=>'Perform Search'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P21_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === apex.jQuery.ui.keyCode.ENTER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(459816337192860026)
,p_event_id=>wwv_flow_imp.id(459814566547860024)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(459783684670859867)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(459816897725860027)
,p_event_id=>wwv_flow_imp.id(459814566547860024)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp.component_end;
end;
/
