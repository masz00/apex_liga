prompt --application/pages/page_00092
begin
--   Manifest
--     PAGE: 00092
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
 p_id=>92
,p_name=>'FormGol'
,p_alias=>'FORMGOL'
,p_page_mode=>'MODAL'
,p_step_title=>'Bramka'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(167631842309662964)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(219345667641448020)
,p_plug_name=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167670576781663002)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(219361858530454411)
,p_plug_name=>unistr('Dodaj bramk\0119')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ZM.ZdarzenieMeczID,',
'    ZMG.GolID,',
'    ZM.Minuta,',
'    M.KlubGospID,',
'    M.KlubGoscID,',
'    M.MeczID,',
'    M.SEDZIAGLOWNYID,',
'    CASE ',
'        WHEN ZG.KlubID = M.KlubGospID THEN ''Gospodarze''',
unistr('        WHEN ZG.KlubID = M.KlubGoscID THEN ''Go\015Bcie'''),
'        ELSE NULL',
unistr('    END AS Zesp\00F3\0142,'),
'    ZMG.ZawodnikStrzelajacyID AS Strzelec,',
'    ZMG.TypGola',
'FROM ',
'    ZdarzenieMecz ZM',
'LEFT JOIN ',
'    ZdarzenieMeczGol ZMG ON ZM.ZdarzenieMeczID = ZMG.ZdarzenieMeczID',
'LEFT JOIN ',
'    Zawodnik ZG ON ZMG.ZawodnikStrzelajacyID = ZG.ZawodnikID',
'JOIN ',
'    Mecz M ON ZM.MeczID = M.MeczID',
'JOIN ',
'    Klub Gosp ON Gosp.KLUBID = M.KLUBGOSPID',
'JOIN ',
'    Klub Gosc ON Gosp.KLUBID = M.KLUBGOSCID',
'WHERE ',
'    ZM.ZdarzenieMeczID = :P32_ZDARZENIEMECZID',
''))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(284036853843077015)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(219345667641448020)
,p_button_name=>'Cofnij'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_image_alt=>'Cofnij'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(284036721318077014)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(219345667641448020)
,p_button_name=>unistr('Usu\0144')
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_image_alt=>unistr('Usu\0144')
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P92_ZDARZENIEMECZID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(284037043704077017)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(219345667641448020)
,p_button_name=>unistr('Utw\00F3rz')
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Utw\00F3rz')
,p_button_position=>'NEXT'
,p_button_condition=>'P92_ZDARZENIEMECZID'
,p_button_condition_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(284036934608077016)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(219345667641448020)
,p_button_name=>'Zapisz'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz'
,p_button_position=>'NEXT'
,p_button_condition=>'P92_ZDARZENIEMECZID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(219367488051454418)
,p_branch_name=>'Go To Page 32'
,p_branch_action=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(219343965017448003)
,p_name=>'P92_ZESPOL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_item_source_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_source=>unistr('ZESP\00D3\0141')
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(219344061032448004)
,p_name=>'P92_STRZELEC'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_item_source_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_prompt=>'Strzelec'
,p_source=>'STRZELEC'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    Z.Imie || '' '' || Z.Nazwisko || '' ('' || K.NAZWA || '') ''  AS DISPLAY_VALUE,',
'    Z.ZawodnikID AS RETURN_VALUE',
'FROM',
'    Zawodnik Z',
'JOIN',
'    SkladMeczowy S ON Z.ZawodnikID = S.ZawodnikID',
'JOIN',
'    Mecz M ON S.MeczID = M.MeczID',
'JOIN',
'    Klub K ON (Z.KlubID = M.KlubGospID AND K.KlubID = M.KlubGospID)',
'         OR (Z.KlubID = M.KlubGoscID AND K.KlubID = M.KlubGoscID)',
'WHERE',
'    S.MeczID = :P92_MECZID',
'    AND (',
'        (:P92_ZESPOL IS NULL)',
'        OR K.Nazwa = :P92_ZESPOL',
'    );'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(219344141478448005)
,p_name=>'P92_TYPGOLA'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_item_source_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_prompt=>'Typ gola'
,p_source=>'TYPGOLA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>unistr('STATIC2:zwyk\0142y;zwykly,karny;karny,samob\00F3j;samoboj')
,p_cSize=>30
,p_cMaxlength=>7
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CONTAINS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_09=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(219344261452448006)
,p_name=>'P92_GOLID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_item_source_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_source=>'GOLID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(219344514662448009)
,p_name=>'P92_KLUBGOSPID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_item_source_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_source=>'KLUBGOSPID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(219344619724448010)
,p_name=>'P92_KLUBGOSCID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_item_source_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_source=>'KLUBGOSCID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(219346885149448032)
,p_name=>'P92_MECZID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_item_source_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_source=>'MECZID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(219362259397454412)
,p_name=>'P92_ZDARZENIEMECZID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_item_source_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_source=>'ZDARZENIEMECZID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(219363476305454414)
,p_name=>'P92_MINUTA'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_item_source_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_prompt=>'Minuta'
,p_source=>'MINUTA'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>wwv_flow_imp.id(167806732996663115)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_03=>'left'
,p_attribute_04=>'decimal'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(284037800572077025)
,p_name=>'P92_SEDZIAGLOWNYID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(219361858530454411)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sedziaglownyid ',
'from mecz',
'where meczid = :P32_MECZID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(314489763982060738)
,p_validation_name=>'Walidacja_minuta_notnull'
,p_validation_sequence=>10
,p_validation=>'P92_MINUTA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wpisa\0107 minut\0119 w pole "Minuta".')
,p_associated_item=>wwv_flow_imp.id(219363476305454414)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(314489847382060739)
,p_validation_name=>'Walidacja_Minuta_NUMER'
,p_validation_sequence=>20
,p_validation=>'P92_MINUTA'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('Prosz\0119 wpisa\0107 liczb\0119 w pole "Minuta".')
,p_associated_item=>wwv_flow_imp.id(219363476305454414)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(314489918221060740)
,p_validation_name=>'Walidacja_strzelec_notnull'
,p_validation_sequence=>30
,p_validation=>'P92_STRZELEC'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wybra\0107 strzelca w pole "Strzelec".')
,p_associated_item=>wwv_flow_imp.id(219344061032448004)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(314490014527060741)
,p_validation_name=>'Walidacja_Typgola_notnull'
,p_validation_sequence=>40
,p_validation=>'P92_TYPGOLA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wybra\0107 typ gola w polu "Typ gola".')
,p_associated_item=>wwv_flow_imp.id(219344141478448005)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(314490320730060744)
,p_validation_name=>'Walidacja_minuta1_90'
,p_validation_sequence=>50
,p_validation=>':P92_MINUTA BETWEEN 1 AND 90'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Minuta gola musi by\0107 mi\0119dzy 1 a 90.')
,p_associated_item=>wwv_flow_imp.id(219363476305454414)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(338951081799529393)
,p_validation_name=>'Walidajcj_minuta_gol_po_czerownej'
,p_validation_sequence=>70
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_red_card_minute NUMBER;',
'BEGIN',
unistr('    -- Pobierz minut\0119 czerwonej kartki (je\015Bli istnieje)'),
'    SELECT MIN(ZM.Minuta)',
'    INTO v_red_card_minute',
'    FROM ZdarzenieMeczKartka ZMK',
'    JOIN ZdarzenieMecz ZM ON ZMK.ZdarzenieMeczID = ZM.ZdarzenieMeczID',
'    WHERE ZMK.ZawodnikKartkowanyID = :P92_STRZELEC',
'      AND ZMK.KolorKartki = ''Czerwona''',
'      AND ZM.MeczID = (SELECT MeczID FROM ZdarzenieMecz WHERE ZdarzenieMeczID = :P92_ZDARZENIEMECZID);',
'',
unistr('    -- Walidacja: minuta gola musi by\0107 przed czerwon\0105 kartk\0105 lub brak czerwonej kartki'),
'    RETURN v_red_card_minute IS NULL OR :P92_MINUTA < v_red_card_minute;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Zawodnik nie mo\017Ce strzeli\0107 gola po otrzymaniu czerwonej kartki.')
,p_associated_item=>wwv_flow_imp.id(219344061032448004)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219347198202448035)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P92_ZESPOL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219347251777448036)
,p_event_id=>wwv_flow_imp.id(219347198202448035)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'aa'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(219361858530454411)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(284037188498077018)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Utw\00F3rz')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'INSERT INTO ZdarzenieMecz (',
'    MeczID,',
'    SedziaID,',
'    Minuta,',
'    TypZdarzenieMecz',
')',
'VALUES (',
'    :P92_MECZID,',
'    :P92_SEDZIAGLOWNYID,',
'    :P92_MINUTA,',
'    ''Gol''',
');',
'',
'INSERT INTO ZdarzenieMeczGol (',
'    ZdarzenieMeczID, ',
'    ZawodnikStrzelajacyID, ',
'    TypGola',
') ',
'VALUES (',
'    (SELECT MAX(ZdarzenieMeczID) FROM ZdarzenieMecz), ',
'    :P92_STRZELEC, ',
'    :P92_TYPGOLA',
');',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(284037043704077017)
,p_internal_uid=>284037188498077018
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(284037265462077019)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Zapisz'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE ZdarzenieMeczGol',
'SET ',
'    TypGola = :P92_TYPGOLA,',
'    ZawodnikStrzelajacyID = :P92_STRZELEC',
'WHERE ',
'    GolID = :P92_GOLID;',
'',
'UPDATE ZdarzenieMecz ',
'SET ',
'    Minuta= :P92_MINUTA',
'WHERE',
'    ZdarzenieMeczID = :P92_ZDARZENIEMECZID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(284036934608077016)
,p_internal_uid=>284037265462077019
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(284037338601077020)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Usu\0144')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM ZdarzenieMeczGol',
'WHERE GolID = :P92_GOLID;',
'DELETE FROM ZdarzenieMecz ',
'WHERE ZdarzenieMeczID = :P92_ZDARZENIEMECZID;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(284036721318077014)
,p_internal_uid=>284037338601077020
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(219367905138454419)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(219361858530454411)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form FormGol'
,p_internal_uid=>219367905138454419
);
wwv_flow_imp.component_end;
end;
/
