prompt --application/pages/page_00038
begin
--   Manifest
--     PAGE: 00038
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
 p_id=>38
,p_name=>'MeczFormCopy'
,p_alias=>'MECZFORMCOPY'
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
 p_id=>wwv_flow_imp.id(365159750579163911)
,p_plug_name=>'Mecz'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select MECZID,',
'       KLUBGOSPID,',
'       KLUBGOSCID,',
'       SEDZIAGLOWNYID,',
'       SEDZIAAS1ID,',
'       SEDZIAAS2ID,',
'       DATAMECZU,',
'       WYNIKKONCOWY,',
'       NRKOLEJKI',
'  from MECZ'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(365167013783163920)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167670576781663002)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_ai_enabled=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(197195617602500478)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(365167013783163920)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_image_alt=>'Cofnij'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(197196010148500479)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(365167013783163920)
,p_button_name=>'DELETE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_image_alt=>unistr('Usu\0144')
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P38_MECZID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(197196494968500479)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(365167013783163920)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz zmiany'
,p_button_position=>'NEXT'
,p_button_condition=>'P38_MECZID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(197196832013500480)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(365167013783163920)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Utw\00F3rz')
,p_button_position=>'NEXT'
,p_button_condition=>'P38_MECZID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(197153981634389123)
,p_name=>'P38_KLUBGOSPID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_item_source_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_prompt=>'Gospodarz'
,p_source=>'KLUBGOSPID'
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
 p_id=>wwv_flow_imp.id(197154078673389124)
,p_name=>'P38_KLUBGOSCID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_item_source_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_prompt=>unistr('Go\015B\0107')
,p_source=>'KLUBGOSCID'
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
 p_id=>wwv_flow_imp.id(197154147904389125)
,p_name=>'P38_SEDZIAGLOWNYID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_item_source_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_prompt=>unistr('S\0119dzia g\0142\00F3wny')
,p_source=>'SEDZIAGLOWNYID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SEDZIA_GLOWNY_IMIE_NAZWISKO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT IMIE || '' '' || NAZWISKO AS imie_nazwisko,',
'       SEDZIAID',
'FROM SEDZIA',
'ORDER BY imie_nazwisko;',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(197154222174389126)
,p_name=>'P38_SEDZIAAS1ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_item_source_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_prompt=>unistr('S\0119dzia asystent nr 1')
,p_source=>'SEDZIAAS1ID'
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
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CONTAINS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_09=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(197154357335389127)
,p_name=>'P38_SEDZIAAS2ID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_item_source_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_prompt=>unistr('S\0119dzia asystent  nr 2')
,p_source=>'SEDZIAAS2ID'
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
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CONTAINS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_09=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(197154465959389128)
,p_name=>'P38_DATAMECZU'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_item_source_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_prompt=>'Datameczu'
,p_source=>'DATAMECZU'
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
 p_id=>wwv_flow_imp.id(197154502223389129)
,p_name=>'P38_WYNIKKONCOWY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_item_source_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_prompt=>unistr('Wynik ko\0144cowy')
,p_source=>'WYNIKKONCOWY'
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
 p_id=>wwv_flow_imp.id(197154676869389130)
,p_name=>'P38_NRKOLEJKI'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_item_source_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_prompt=>'Numer kolejki'
,p_source=>'NRKOLEJKI'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365161055234163915)
,p_name=>'P38_MECZID'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(365159750579163911)
,p_item_source_plug_id=>wwv_flow_imp.id(365159750579163911)
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
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(248184313452521241)
,p_validation_name=>'Gosp_notnull'
,p_validation_sequence=>10
,p_validation=>'P38_KLUBGOSPID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wybra\0107 gospodarza meczu w pole "Gospodarz".')
,p_associated_item=>wwv_flow_imp.id(197153981634389123)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(248184680614521244)
,p_validation_name=>'Gosc_Notnull'
,p_validation_sequence=>20
,p_validation=>'P38_KLUBGOSCID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wybra\0107 go\015Bcia meczu  w pole "Go\015B\0107".')
,p_associated_item=>wwv_flow_imp.id(197154078673389124)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(248184851553521246)
,p_validation_name=>'Sgnotnull'
,p_validation_sequence=>30
,p_validation=>'P38_SEDZIAGLOWNYID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wybra\0107 s\0119dziego g\0142\00F3wnego w pole s\0119dzia g\0142\00F3wny.')
,p_associated_item=>wwv_flow_imp.id(197154147904389125)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(248184954406521247)
,p_validation_name=>'Sa1NotNull'
,p_validation_sequence=>40
,p_validation=>'P38_SEDZIAAS1ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wybra\0107 s\0119dziego asystenta nr 1.')
,p_associated_item=>wwv_flow_imp.id(197154222174389126)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(248185022141521248)
,p_validation_name=>'Sa1NOtnull'
,p_validation_sequence=>50
,p_validation=>'P38_SEDZIAAS2ID'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wybra\0107 s\0119dziego asystenta tego meczu.')
,p_associated_item=>wwv_flow_imp.id(197154357335389127)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(248185147523521249)
,p_validation_name=>'Datameczu_notnull'
,p_validation_sequence=>60
,p_validation=>'P38_DATAMECZU'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wybra\0107 dat\0119 meczu.')
,p_associated_item=>wwv_flow_imp.id(197154465959389128)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(248185240883521250)
,p_validation_name=>'Wyniknotnull'
,p_validation_sequence=>70
,p_validation=>'P38_WYNIKKONCOWY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wpisa\0107 wynik ko\0144cowy tego meczu.')
,p_associated_item=>wwv_flow_imp.id(197154502223389129)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(284035423734077001)
,p_validation_name=>'KolejkaNotNull'
,p_validation_sequence=>80
,p_validation=>'P38_NRKOLEJKI'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wpisa\0107 nr kolejki.')
,p_associated_item=>wwv_flow_imp.id(197154676869389130)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(284035556902077002)
,p_validation_name=>'Kolejkawiekszaniz0'
,p_validation_sequence=>90
,p_validation=>'P38_NRKOLEJKI'
,p_validation_type=>'ITEM_NOT_ZERO'
,p_error_message=>unistr('Numer kolejki musi by\0107 wi\0119kszy ni\017C 0.')
,p_associated_item=>wwv_flow_imp.id(197154676869389130)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(284035682905077003)
,p_validation_name=>'KolejkaNumerTylko'
,p_validation_sequence=>100
,p_validation=>'P38_NRKOLEJKI'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('Numer kolejki musi by\0107 liczb\0105.')
,p_associated_item=>wwv_flow_imp.id(197154676869389130)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(284035719709077004)
,p_validation_name=>'Walidacja_SA1_rowny_SG'
,p_validation_sequence=>110
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P38_SEDZIAAS1ID = :P38_SEDZIAGLOWNYID THEN',
'        RETURN FALSE;',
'    ELSE',
'        RETURN TRUE;',
'    END IF;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('S\0119dzia asystent nr 1 nie mo\017Ce by\0107 tym samym s\0119dzi\0105, co s\0119dzia g\0142\00F3wny.')
,p_associated_item=>wwv_flow_imp.id(197154222174389126)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(314486292173060703)
,p_validation_name=>'Walidaja_Wynik_Regex'
,p_validation_sequence=>120
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'REGEXP_LIKE(:P38_WYNIKKONCOWY, ''^\d+:\d+$'')'))
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Wynik musi by\0107 w formacie liczba:liczba, np. 2:1.')
,p_associated_item=>wwv_flow_imp.id(197154502223389129)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(314486386040060704)
,p_validation_name=>'Walidacja_SA2_rowny_SG'
,p_validation_sequence=>130
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P38_SEDZIAAS2ID = :P38_SEDZIAGLOWNYID THEN',
'        RETURN FALSE; ',
'    ELSE',
'        RETURN TRUE;',
'    END IF;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('S\0119dzia asystent nr 2 nie mo\017Ce by\0107 tym samym s\0119dzi\0105, co s\0119dzia g\0142\00F3wny.')
,p_associated_item=>wwv_flow_imp.id(197154357335389127)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(314486478295060705)
,p_validation_name=>'Walidacja_SA2_rowny_SA1'
,p_validation_sequence=>140
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P38_SEDZIAAS2ID = :P38_SEDZIAAS1ID THEN',
'        RETURN FALSE; ',
'    ELSE',
'        RETURN TRUE;',
'    END IF;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('S\0119dzia asystent 2 nie mo\017Ce by\0107 tym samym s\0119dzi\0105, co s\0119dzia asystent nr 2.')
,p_associated_item=>wwv_flow_imp.id(197154357335389127)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(197197864087500481)
,p_name=>'Cancel Dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(197195617602500478)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(197198352597500483)
,p_event_id=>wwv_flow_imp.id(197197864087500481)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(197194976427500478)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(365159750579163911)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Mecz'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>197194976427500478
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(197197455353500480)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>197197455353500480
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(197194583968500477)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(365159750579163911)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Mecz'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>197194583968500477
);
wwv_flow_imp.component_end;
end;
/
