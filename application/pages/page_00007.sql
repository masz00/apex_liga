prompt --application/pages/page_00007
begin
--   Manifest
--     PAGE: 00007
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
 p_id=>7
,p_name=>'Mecz'
,p_alias=>'MECZ'
,p_page_mode=>'MODAL'
,p_step_title=>'Mecz'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(167631842309662964)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(167971665132663446)
,p_plug_name=>'Mecz'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select MECZID,',
'       gosp.NAZWA as Gospodarz,',
unistr('       gosc.NAZWA as Go\015B\0107,'),
unistr('       Sg.IMIE || '' '' || Sg.NAZWISKO as S\0119dzia_g\0142\00F3wny,'),
unistr('       As1.IMIE || '' '' || As1.NAZWISKO as S\0119dzia_asystent_nr_1,'),
unistr('       As2.IMIE || '' '' || As2.NAZWISKO as S\0119dzia_asystent_nr_2,'),
'       m.DATAMECZU as Data_meczu,',
'       m.WYNIKKONCOWY as Wynik,',
'       m.NRKOLEJKI as Kolejka',
'from MECZ m ',
'join Sedzia Sg ON m.SEDZIAGLOWNYID = Sg.SEDZIAID',
'join Sedzia As1 ON m.SEDZIAAS1ID = As1.SEDZIAID',
'join Sedzia  As2 ON m.SEDZIAAS2ID = As2.SEDZIAID',
'join Klub Gosp on m.KLUBGOSPID = Gosp.KLUBID',
'join Klub Gosc on m.KLUBGOSCID = Gosc.KLUBID'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(167978928336663455)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167670576781663002)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(167979394407663455)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(167978928336663455)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_image_alt=>'Cofnij'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(167980700438663457)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(167978928336663455)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_image_alt=>unistr('Usu\0144')
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P7_MECZID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(167981178408663457)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(167978928336663455)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz zmiany'
,p_button_position=>'NEXT'
,p_button_condition=>'P7_MECZID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(167981507822663458)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(167978928336663455)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Utw\00F3rz')
,p_button_position=>'NEXT'
,p_button_condition=>'P7_MECZID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(167972036078663446)
,p_name=>'P7_MECZID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_item_source_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Meczid'
,p_source=>'MECZID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(167806732996663115)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(175070580980498544)
,p_name=>'P7_GOSPODARZ'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_item_source_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_prompt=>'Gospodarz'
,p_source=>'GOSPODARZ'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'KLUB.NAZWA'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CONTAINS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_09=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(175070611650498545)
,p_name=>unistr('P7_GO\015A\0106')
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_item_source_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_prompt=>unistr('Go\015B\0107')
,p_source=>unistr('GO\015A\0106')
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'KLUB.NAZWA'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CONTAINS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_09=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(175070797576498546)
,p_name=>unistr('P7_S\0118DZIA_G\0141\00D3WNY')
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_item_source_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_prompt=>unistr('S\0119dzia g\0142\00F3wny')
,p_source=>unistr('S\0118DZIA_G\0141\00D3WNY')
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'SEDZIA_GLOWNY_IMIE_NAZWISKO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT IMIE || '' '' || NAZWISKO AS imie_nazwisko,',
'       SEDZIAID',
'FROM SEDZIA',
'ORDER BY imie_nazwisko;',
''))
,p_cSize=>30
,p_cMaxlength=>101
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CONTAINS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_09=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(175070806869498547)
,p_name=>unistr('P7_S\0118DZIA_ASYSTENT_NR_1')
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_item_source_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_prompt=>unistr('S\0119dzia asystent Nr 1')
,p_source=>unistr('S\0118DZIA_ASYSTENT_NR_1')
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'SEDZIA_GLOWNY_IMIE_NAZWISKO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT IMIE || '' '' || NAZWISKO AS imie_nazwisko,',
'       SEDZIAID',
'FROM SEDZIA',
'ORDER BY imie_nazwisko;',
''))
,p_cSize=>30
,p_cMaxlength=>101
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CONTAINS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_09=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(175070914118498548)
,p_name=>unistr('P7_S\0118DZIA_ASYSTENT_NR_2')
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_item_source_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_prompt=>unistr('S\0119dzia asystent Nr 2')
,p_source=>unistr('S\0118DZIA_ASYSTENT_NR_2')
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'SEDZIA_GLOWNY_IMIE_NAZWISKO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT IMIE || '' '' || NAZWISKO AS imie_nazwisko,',
'       SEDZIAID',
'FROM SEDZIA',
'ORDER BY imie_nazwisko;',
''))
,p_cSize=>30
,p_cMaxlength=>101
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CONTAINS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_09=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(175071035380498549)
,p_name=>'P7_DATA_MECZU'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_item_source_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_prompt=>'Data meczu'
,p_source=>'DATA_MECZU'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'POPUP'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(175071100744498550)
,p_name=>'P7_WYNIK'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_item_source_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_prompt=>'Wynik'
,p_source=>'WYNIK'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(177948368480883001)
,p_name=>'P7_KOLEJKA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_item_source_plug_id=>wwv_flow_imp.id(167971665132663446)
,p_prompt=>'Kolejka'
,p_source=>'KOLEJKA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(167979468357663455)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(167979394407663455)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(167980275223663456)
,p_event_id=>wwv_flow_imp.id(167979468357663455)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(167982373479663458)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(167971665132663446)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Mecz'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>167982373479663458
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(167982788155663459)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>167982788155663459
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(167981953948663458)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(167971665132663446)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Mecz'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>167981953948663458
);
wwv_flow_imp.component_end;
end;
/
