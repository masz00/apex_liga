prompt --application/pages/page_00006
begin
--   Manifest
--     PAGE: 00006
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
 p_id=>6
,p_name=>'Mecz'
,p_alias=>'MECZ1'
,p_step_title=>'Mecz'
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
 p_id=>wwv_flow_imp.id(167983334437663460)
,p_plug_name=>'Mecz'
,p_region_name=>'IR_STATIC'
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select MECZID,',
'       gosp.NAZWA as Gospodarz,',
unistr('       gosc.NAZWA as Go\015B\0107,'),
'       gosp.NAZWA || '' - '' || gosc.NAZWA as Mecz_Pelna_Nazwa,',
'       sg.imie || '' '' || sg.nazwisko as sedzia_glowny,',
'       sa1.imie || '' '' || sa1.nazwisko as sedzia_as1,',
'       sa2.imie || '' '' || sa2.nazwisko as sedzia_as2,',
'       DATAMECZU,',
'       WYNIKKONCOWY,',
'       NRKOLEJKI',
'from MECZ m join SEDZIA sg on m.SEDZIAGLOWNYID = sg.SEDZIAID',
'    join SEDZIA sa1 on m.SEDZIAAS1ID = sa1.SEDZIAID',
'    join SEDZIA sa2 on m.SEDZIAAS2ID = sa2.SEDZIAID',
'    join KLUB gosp on m.KLUBGOSPID = gosp.KLUBID ',
'    join KLUB gosc on m.KLUBGOSCID = gosc.KLUBID'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Mecz'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(167983427918663460)
,p_name=>'Mecz'
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
,p_detail_link=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:RP,:P38_MECZID:#MECZID#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_owner=>'MACIEJ.SZYMANIAK@STUDENT.PUT.POZNAN.PL'
,p_internal_uid=>167983427918663460
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(167984169044663461)
,p_db_column_name=>'MECZID'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Meczid'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(167986528673663464)
,p_db_column_name=>'DATAMECZU'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Data meczu'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(167986921987663465)
,p_db_column_name=>'WYNIKKONCOWY'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Wynik'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(167987350324663465)
,p_db_column_name=>'NRKOLEJKI'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Kolejka'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168231328121673017)
,p_db_column_name=>'SEDZIA_GLOWNY'
,p_display_order=>39
,p_column_identifier=>'L'
,p_column_label=>unistr('S\0119dzia gl\00F3wny')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168231484139673018)
,p_db_column_name=>'SEDZIA_AS1'
,p_display_order=>49
,p_column_identifier=>'M'
,p_column_label=>unistr('S\0119dzia asystent nr 1')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168231552680673019)
,p_db_column_name=>'SEDZIA_AS2'
,p_display_order=>59
,p_column_identifier=>'N'
,p_column_label=>unistr('S\0119dzia asystent nr 2 ')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168231687610673020)
,p_db_column_name=>'GOSPODARZ'
,p_display_order=>69
,p_column_identifier=>'O'
,p_column_label=>'Gospodarz'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(168231773535673021)
,p_db_column_name=>unistr('GO\015A\0106')
,p_display_order=>79
,p_column_identifier=>'P'
,p_column_label=>unistr('Go\015B\0107')
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(174851556492062330)
,p_db_column_name=>'MECZ_PELNA_NAZWA'
,p_display_order=>89
,p_column_identifier=>'Q'
,p_column_label=>'Mecz Pelna Nazwa'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(168137407082663979)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1681375'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_view_mode=>'REPORT'
,p_report_columns=>unistr('GOSPODARZ:GO\015A\0106:WYNIKKONCOWY:DATAMECZU:SEDZIA_GLOWNY:SEDZIA_AS1:SEDZIA_AS2:NRKOLEJKI:')
,p_sort_column_1=>'NRKOLEJKI'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'KLUBGOSPID'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'KLUBGOSCID'
,p_sort_direction_3=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(167989003130663467)
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
 p_id=>wwv_flow_imp.id(167987841570663466)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(167983334437663460)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Dodaj mecz'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:7::'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(167988102600663466)
,p_name=>'Edit Report - Dialog Closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(167983334437663460)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(167988645238663467)
,p_event_id=>wwv_flow_imp.id(167988102600663466)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(167983334437663460)
);
wwv_flow_imp.component_end;
end;
/
