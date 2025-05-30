prompt --application/pages/page_00037
begin
--   Manifest
--     PAGE: 00037
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
 p_id=>37
,p_name=>'SkladForm'
,p_alias=>'SKLADFORM'
,p_page_mode=>'MODAL'
,p_step_title=>'SkladForm'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(167631842309662964)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(865598644586813315)
,p_plug_name=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167670576781663002)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(865614835475819706)
,p_plug_name=>unistr('Sk\0142adForm')
,p_title=>unistr('Sk\0142ad')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    SM.SkladMeczowyID,',
'    SM.MeczID,',
'    SM.ZAWODNIKID,',
'    SM.RolaWSkladzie,',
'    K.Nazwa AS Klub',
'FROM ',
'    SkladMeczowy SM',
'    JOIN Zawodnik Z ON SM.ZawodnikID = Z.ZawodnikID',
'    JOIN Klub K ON Z.KlubID = K.KlubID',
'WHERE',
'    SM.SkladMeczowyID = :P37_SKLADMECZOWYID',
''))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(340822332480796138)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(865598644586813315)
,p_button_name=>'Cofnij'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_image_alt=>'Cofnij'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(340823101544796138)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(865598644586813315)
,p_button_name=>unistr('Utw\00F3rz')
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Utw\00F3rz')
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(340832412830796151)
,p_branch_name=>'Go To Page 32'
,p_branch_action=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(340580581325723516)
,p_name=>'P37_ROLAWSKLADZIE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(865614835475819706)
,p_item_source_plug_id=>wwv_flow_imp.id(865614835475819706)
,p_source=>'ROLAWSKLADZIE'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(340580639092723517)
,p_name=>'P37_KLUB'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(865614835475819706)
,p_item_source_plug_id=>wwv_flow_imp.id(865614835475819706)
,p_source=>'KLUB'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(340580951465723520)
,p_name=>'P37_SKLADMECZOWYID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(865614835475819706)
,p_item_source_plug_id=>wwv_flow_imp.id(865614835475819706)
,p_source=>'SKLADMECZOWYID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(340583302440723544)
,p_name=>'P37_ZAWODNIKID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(865614835475819706)
,p_item_source_plug_id=>wwv_flow_imp.id(865614835475819706)
,p_prompt=>'Zawodnik'
,p_source=>'ZAWODNIKID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT z.Nazwisko || '' '' || z.Imie,',
'       z.ZawodnikID',
'  FROM Zawodnik z',
'  JOIN Mecz m ON m.MeczID = :P37_MECZID',
' WHERE z.KlubID = CASE ',
'                    WHEN :P37_KLUB = ''Gospodarz'' THEN m.KlubGospID',
unistr('                    WHEN :P37_KLUB = ''Go\015B\0107''      THEN m.KlubGoscID'),
'                  END',
' ORDER BY z.Nazwisko',
''))
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
 p_id=>wwv_flow_imp.id(865605027906813335)
,p_name=>'P37_MECZID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(865614835475819706)
,p_item_source_plug_id=>wwv_flow_imp.id(865614835475819706)
,p_source=>'MECZID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(930295943329442328)
,p_name=>'P37_SEDZIAGLOWNYID'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(865614835475819706)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sedziaglownyid ',
'from mecz',
'where meczid = :P32_MECZID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(459720188436818438)
,p_validation_name=>'Walidacja_notnull'
,p_validation_sequence=>10
,p_validation=>'P37_ZAWODNIKID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wybra\0107 zawodnika.')
,p_associated_item=>wwv_flow_imp.id(340583302440723544)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(340831436166796150)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P37_ZESPOL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(340831959116796150)
,p_event_id=>wwv_flow_imp.id(340831436166796150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'aa'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(865614835475819706)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(340830215812796149)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Utw\00F3rz')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' INSERT INTO SkladMeczowy (',
'      MeczID,',
'      ZawodnikID,',
'      RolaWSkladzie',
'    )',
'    VALUES (',
'      :P37_MECZID,',
'      :P37_ZAWODNIKID,   ',
'      :P37_ROLAWSKLADZIE  ',
'    );',
'   '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(340823101544796138)
,p_internal_uid=>340830215812796149
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(340829739516796148)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(865614835475819706)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form FormGol'
,p_internal_uid=>340829739516796148
);
wwv_flow_imp.component_end;
end;
/
