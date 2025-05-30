prompt --application/pages/page_00002
begin
--   Manifest
--     PAGE: 00002
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
 p_id=>2
,p_name=>'Klub'
,p_alias=>'KLUB1'
,p_step_title=>'Klub'
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
 p_id=>wwv_flow_imp.id(167951776275663349)
,p_plug_name=>'Klub'
,p_region_name=>'STATIC_KLUB'
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>10
,p_plug_display_column=>1
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select k.KLUBID,',
'       k.NAZWA,',
'       t.IMIE || '' '' || t.NAZWISKO as Trener_Imie_Nazwisko,',
'       k.LIGAID,',
'       k.ADRES,',
'       k.STADIONID,',
'       k.DATAZAL',
'  from KLUB k join TRENER t on k.TRENERID = t.TRENERID'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Klub'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(167951863747663349)
,p_name=>'Klub'
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
,p_detail_link=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:RP:P3_KLUBID:\#KLUBID#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'MACIEJ.SZYMANIAK@STUDENT.PUT.POZNAN.PL'
,p_internal_uid=>167951863747663349
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(167952502859663351)
,p_db_column_name=>'KLUBID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Klubid'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(167952900231663353)
,p_db_column_name=>'NAZWA'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Nazwa klubu'
,p_column_link=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RR,32:P32_SEARCH:#NAZWA#'
,p_column_linktext=>'#NAZWA#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(177948493903883002)
,p_db_column_name=>'TRENER_IMIE_NAZWISKO'
,p_display_order=>12
,p_column_identifier=>'K'
,p_column_label=>'Trener'
,p_column_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RR,2:IR[IR_TRENER]EQ_IMIE_I_NAZWISKO:#TRENER_IMIE_NAZWISKO#'
,p_column_linktext=>'#TRENER_IMIE_NAZWISKO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(167953340747663353)
,p_db_column_name=>'ADRES'
,p_display_order=>32
,p_column_identifier=>'C'
,p_column_label=>'Adres'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(167954986811663355)
,p_db_column_name=>'DATAZAL'
,p_display_order=>42
,p_column_identifier=>'G'
,p_column_label=>unistr('Data za\0142o\017Cenia')
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168229910789673003)
,p_db_column_name=>'STADIONID'
,p_display_order=>52
,p_column_identifier=>'I'
,p_column_label=>'Stadion'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(167944241064663340)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(177948622756883004)
,p_db_column_name=>'LIGAID'
,p_display_order=>62
,p_column_identifier=>'M'
,p_column_label=>'Liga'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(167942809793663338)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(168119821658663955)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1681199'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>'NAZWA:TRENER_IMIE_NAZWISKO:STADIONID:ADRES:DATAZAL:LIGAID:'
,p_sort_column_1=>'NAZWA'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(167956609919663357)
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
 p_id=>wwv_flow_imp.id(167955480884663355)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(167951776275663349)
,p_button_name=>'Dodaj_klub'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj klub'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&APP_SESSION.::&DEBUG.:3::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(167955793361663356)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(167951776275663349)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(167956272620663356)
,p_event_id=>wwv_flow_imp.id(167955793361663356)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(167951776275663349)
);
wwv_flow_imp.component_end;
end;
/
