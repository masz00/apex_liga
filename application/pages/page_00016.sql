prompt --application/pages/page_00016
begin
--   Manifest
--     PAGE: 00016
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
 p_id=>16
,p_name=>'Zawodnik'
,p_alias=>'ZAWODNIK1'
,p_step_title=>'Zawodnik'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>To find data enter a search term into the search dialog, or click on the column headings to limit the records returned.</p>',
'',
'<p>You can perform numerous functions by clicking the <strong>Actions</strong> button. This includes selecting the columns that are displayed / hidden and their display sequence, plus numerous data and format functions.  You can also define additiona'
||'l views of the data using the chart, group by, and pivot options.</p>',
'',
'<p>If you want to save your customizations select report, or click download to unload the data. Enter you email address and time frame under subscription to be sent the data on a regular basis.<p>',
'',
'<p>For additional information click Help at the bottom of the Actions menu.</p> ',
'',
'<p>Click the <strong>Reset</strong> button to reset the interactive report back to the default settings.</p>'))
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168057099888663730)
,p_plug_name=>'Zawodnik'
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>8
,p_plug_display_column=>1
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT Z.ZawodnikID,',
'       Z.Imie || '' '' || Z.Nazwisko AS Imie_i_nazwisko,',
'       Z.CzyBadaniaZdrowotne AS Czy_posiada_aktualne_badania_zdrowotne,',
'       Z.DataUrodzenia AS Data_urodzenia,',
'       CASE ',
unistr('           WHEN Z.Pozycja = ''O'' THEN ''Obro\0144ca'''),
'           WHEN Z.Pozycja = ''P'' THEN ''Pomocnik''',
'           WHEN Z.Pozycja = ''N'' THEN ''Napastnik''',
'           WHEN Z.Pozycja = ''B'' THEN ''Bramkarz''',
'           ELSE ''Nieznana pozycja''',
'       END AS Pozycja,',
'       CASE ',
'           WHEN Z.KlubID IS NOT NULL THEN K.Nazwa',
'           ELSE NULL',
'       END AS Klub',
'FROM Zawodnik Z',
'LEFT JOIN Klub K ON Z.KlubID = K.KlubID;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Zawodnik'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(168057124936663730)
,p_name=>'Zawodnik'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:17:&APP_SESSION.::&DEBUG.:RP:P17_ZAWODNIKID:\#ZAWODNIKID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'MACIEJ.SZYMANIAK@STUDENT.PUT.POZNAN.PL'
,p_internal_uid=>168057124936663730
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168057814077663732)
,p_db_column_name=>'ZAWODNIKID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Zawodnikid'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168060284410663734)
,p_db_column_name=>'POZYCJA'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Pozycja'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168232428011673028)
,p_db_column_name=>'IMIE_I_NAZWISKO'
,p_display_order=>27
,p_column_identifier=>'I'
,p_column_label=>'Imie i nazwisko'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168232565602673029)
,p_db_column_name=>'CZY_POSIADA_AKTUALNE_BADANIA_ZDROWOTNE'
,p_display_order=>37
,p_column_identifier=>'J'
,p_column_label=>'Czy posiada aktualne badania zdrowotne'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168232674724673030)
,p_db_column_name=>'DATA_URODZENIA'
,p_display_order=>47
,p_column_identifier=>'K'
,p_column_label=>'Data Urodzenia'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(175067895702498517)
,p_db_column_name=>'KLUB'
,p_display_order=>57
,p_column_identifier=>'L'
,p_column_label=>'Klub'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(168182570615664040)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1681826'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'IMIE_I_NAZWISKO:KLUB:POZYCJA:CZY_POSIADA_AKTUALNE_BADANIA_ZDROWOTNE:DATA_URODZENIA:'
,p_sort_column_1=>'IMIE_I_NAZWISKO'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'KLUBID'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(168061968904663736)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167746708932663065)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(167631056795662963)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(167809543388663118)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168060733867663735)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(168057099888663730)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj zawodnika'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:17:&APP_SESSION.::&DEBUG.:17::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168061038789663735)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(168057099888663730)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168061538752663736)
,p_event_id=>wwv_flow_imp.id(168061038789663735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(168057099888663730)
);
wwv_flow_imp.component_end;
end;
/
