prompt --application/pages/page_00035
begin
--   Manifest
--     PAGE: 00035
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
 p_id=>35
,p_name=>'KartkaForm'
,p_alias=>'KARTKAFORM1'
,p_page_mode=>'MODAL'
,p_step_title=>'Kartki'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(167631842309662964)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(524777263242017180)
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
 p_id=>wwv_flow_imp.id(524793454131023571)
,p_plug_name=>'KartkaForm'
,p_title=>'Kartka'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ZM.ZdarzenieMeczID,',
'    ZMK.KartkaID,',
'    ZM.Minuta,',
'    M.KlubGospID,',
'    M.KlubGoscID,',
'    M.MeczID,',
'    M.SEDZIAGLOWNYID,',
'    CASE ',
'        WHEN ZK.KlubID = M.KlubGospID THEN ''Gospodarze''',
unistr('        WHEN ZK.KlubID = M.KlubGoscID THEN ''Go\015Bcie'''),
'        ELSE NULL',
unistr('    END AS Zesp\00F3\0142,'),
'    ZMK.ZawodnikKartkowanyID AS ZawodnikKartkowany,',
'    ZMK.KolorKartki',
'FROM ',
'    ZdarzenieMecz ZM',
'LEFT JOIN ',
'    ZdarzenieMeczKartka ZMK ON ZM.ZdarzenieMeczID = ZMK.ZdarzenieMeczID',
'LEFT JOIN ',
'    Zawodnik ZK ON ZMK.ZawodnikKartkowanyID = ZK.ZawodnikID',
'JOIN ',
'    Mecz M ON ZM.MeczID = M.MeczID',
'JOIN ',
'    Klub Gosp ON Gosp.KLUBID = M.KLUBGOSPID',
'JOIN ',
'    Klub Gosc ON Gosp.KLUBID = M.KLUBGOSCID',
'WHERE ',
'    ZM.ZdarzenieMeczID = :P32_ZDARZENIEMECZID;',
''))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(305432575931569162)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(524777263242017180)
,p_button_name=>'Cofnij'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_image_alt=>'Cofnij'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(305432146977569162)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(524777263242017180)
,p_button_name=>unistr('Usu\0144')
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_image_alt=>unistr('Usu\0144')
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P35_ZDARZENIEMECZID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(305433312999569163)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(524777263242017180)
,p_button_name=>unistr('Utw\00F3rz')
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Utw\00F3rz')
,p_button_position=>'NEXT'
,p_button_condition=>'P35_ZDARZENIEMECZID'
,p_button_condition_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(305432964637569162)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(524777263242017180)
,p_button_name=>'Zapisz'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz'
,p_button_position=>'NEXT'
,p_button_condition=>'P35_ZDARZENIEMECZID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(305442634605569174)
,p_branch_name=>'Go To Page 32'
,p_branch_action=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(304836406372072937)
,p_name=>'P35_KARTKAID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_item_source_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_source=>'KARTKAID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(304836667100072939)
,p_name=>'P35_ZAWODNIKKARTKOWANY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_item_source_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_prompt=>'Zawodnik kartkowany'
,p_source=>'ZAWODNIKKARTKOWANY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    Z.Imie || '' '' || Z.Nazwisko  || '' ('' || K.NAZWA || '') '' AS DISPLAY_VALUE,',
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
'    S.MeczID = :P35_MECZID',
'    AND (',
'        (:P35_ZESPOL IS NULL)',
'        OR K.Nazwa = :P35_ZESPOL',
'    );'))
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
 p_id=>wwv_flow_imp.id(304836735986072940)
,p_name=>'P35_KOLORKARTKI'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_item_source_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_prompt=>'Kolor kartki'
,p_source=>'KOLORKARTKI'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>unistr('STATIC:\017B\00F3\0142ta;Zolta,Czerwona;Czerwona')
,p_cSize=>30
,p_cMaxlength=>8
,p_field_template=>wwv_flow_imp.id(167805451977663113)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attribute_01=>'CONTAINS'
,p_attribute_02=>'N'
,p_attribute_04=>'N'
,p_attribute_09=>'0'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(524778129941017167)
,p_name=>'P35_ZESPOL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_item_source_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_source=>unistr('ZESP\00D3\0141')
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(524778679586017173)
,p_name=>'P35_KLUBGOSPID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_item_source_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_source=>'KLUBGOSPID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(524778784648017174)
,p_name=>'P35_KLUBGOSCID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_item_source_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_source=>'KLUBGOSCID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(524781050073017196)
,p_name=>'P35_MECZID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_item_source_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_source=>'MECZID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(524796424321023576)
,p_name=>'P35_ZDARZENIEMECZID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_item_source_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_source=>'ZDARZENIEMECZID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(524797641229023578)
,p_name=>'P35_MINUTA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_item_source_plug_id=>wwv_flow_imp.id(524793454131023571)
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
 p_id=>wwv_flow_imp.id(589471965495646189)
,p_name=>'P35_SEDZIAGLOWNYID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(524793454131023571)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sedziaglownyid ',
'from mecz',
'where meczid = :P32_MECZID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(459720306582818440)
,p_validation_name=>'New'
,p_validation_sequence=>10
,p_validation=>'P35_MINUTA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wpisa\0107 minut\0119 w pole "Minuta".')
,p_associated_item=>wwv_flow_imp.id(524797641229023578)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(459720426891818441)
,p_validation_name=>'Walidacja_Minuta_NUMER'
,p_validation_sequence=>20
,p_validation=>'P35_MINUTA'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('Prosz\0119 wpisa\0107 liczb\0119 w pole "Minuta".')
,p_associated_item=>wwv_flow_imp.id(524797641229023578)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(459720519471818442)
,p_validation_name=>'Walidacja_minuta1_90'
,p_validation_sequence=>30
,p_validation=>':P35_MINUTA BETWEEN 1 AND 90'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Minuta gola musi by\0107 mi\0119dzy 1 a 90.')
,p_associated_item=>wwv_flow_imp.id(524797641229023578)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(459720668811818443)
,p_validation_name=>'walidacja_typ_kartki'
,p_validation_sequence=>40
,p_validation=>'P35_KOLORKARTKI'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wybra\0107 kolor kartki')
,p_associated_item=>wwv_flow_imp.id(304836735986072940)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(459720792161818444)
,p_validation_name=>'Walidacja_kartkazawodnik'
,p_validation_sequence=>50
,p_validation=>'P35_ZAWODNIKKARTKOWANY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 poprawnie wybra\0107 zawodnika kt\00F3ry otrzyma\0142 kartk\0119.')
,p_associated_item=>wwv_flow_imp.id(304836667100072939)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(305441635503569173)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P35_ZESPOL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(305442113102569173)
,p_event_id=>wwv_flow_imp.id(305441635503569173)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'aa'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(524793454131023571)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(305440432370569172)
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
'    :P35_MECZID,',
'    :P35_SEDZIAGLOWNYID,',
'    :P35_MINUTA,',
'    ''Kartka''',
');',
'',
'INSERT INTO ZdarzenieMeczKartka (',
'    ZdarzenieMeczID, ',
'    ZawodnikKartkowanyID, ',
'    KolorKartki',
') ',
'VALUES (',
'    (SELECT MAX(ZdarzenieMeczID) FROM ZdarzenieMecz), ',
'    :P35_ZAWODNIKKARTKOWANY, ',
'    :P35_KOLORKARTKI',
');',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(305433312999569163)
,p_internal_uid=>305440432370569172
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(305440811748569172)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Zapisz'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE ZdarzenieMeczKartka',
'SET ',
'    KolorKartki = :P35_KOLORKARTKI,',
'    ZawodnikKartkowanyID = :P35_ZAWODNIKKARTKOWANY',
'WHERE ',
'    KartkaID = :P35_KartkaID;',
'',
'UPDATE ZdarzenieMecz ',
'SET ',
'    Minuta= :P35_MINUTA',
'WHERE',
'    ZdarzenieMeczID = :P35_ZDARZENIEMECZID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(305432964637569162)
,p_internal_uid=>305440811748569172
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(305441242925569172)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Usu\0144')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM ZdarzenieMeczKartka',
'WHERE KartkaID = :P35_KartkaID;',
'DELETE FROM ZdarzenieMecz ',
'WHERE ZdarzenieMeczID = :P35_ZDARZENIEMECZID;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(305432146977569162)
,p_internal_uid=>305441242925569172
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(305439907263569171)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(524793454131023571)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form FormGol'
,p_internal_uid=>305439907263569171
);
wwv_flow_imp.component_end;
end;
/
