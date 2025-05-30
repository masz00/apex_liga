prompt --application/pages/page_00036
begin
--   Manifest
--     PAGE: 00036
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
 p_id=>36
,p_name=>'ZmianaForm'
,p_alias=>'ZMIANAFORM'
,p_page_mode=>'MODAL'
,p_step_title=>'ZmianaForm'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(167631842309662964)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_protection_level=>'C'
,p_page_component_map=>'16'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(830383515413965180)
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
 p_id=>wwv_flow_imp.id(830399706302971571)
,p_plug_name=>'ZmianaForm'
,p_title=>'Zmiana'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(167667717117663000)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    ZM.ZdarzenieMeczID,',
'    ZMZ.ZmianaID,',
'    ZM.Minuta,',
'    M.KlubGospID,',
'    M.KlubGoscID,',
'    M.MeczID,',
'    M.SEDZIAGLOWNYID,',
'    ZMZ.ZawodnikSchodzacyID AS ZawodnikSchodzacy,',
'    ZMZ.ZawodnikWchodzacyID AS ZawodnikWchodzacy',
'FROM ',
'    ZdarzenieMecz ZM',
'LEFT JOIN ',
'    ZdarzenieMeczZmiana ZMZ ON ZM.ZdarzenieMeczID = ZMZ.ZdarzenieMeczID',
'LEFT JOIN ',
'    Zawodnik ZS ON ZMZ.ZawodnikSchodzacyID = ZS.ZawodnikID',
'LEFT JOIN ',
'    Zawodnik ZW ON ZMZ.ZawodnikWchodzacyID = ZW.ZawodnikID',
'JOIN ',
'    Mecz M ON ZM.MeczID = M.MeczID',
'JOIN ',
'    Klub Gosp ON Gosp.KLUBID = M.KLUBGOSPID',
'JOIN ',
'    Klub Gosc ON Gosp.KLUBID = M.KLUBGOSCID',
'WHERE ',
'    ZM.ZdarzenieMeczID = :P36_ZDARZENIEMECZID;',
''))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(305607206798948004)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(830383515413965180)
,p_button_name=>'Cofnij'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_image_alt=>'Cofnij'
,p_button_position=>'CLOSE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(305606843111948001)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(830383515413965180)
,p_button_name=>unistr('Usu\0144')
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_image_alt=>unistr('Usu\0144')
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P36_ZDARZENIEMECZID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(305608086534948004)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(830383515413965180)
,p_button_name=>unistr('Utw\00F3rz')
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Utw\00F3rz')
,p_button_position=>'NEXT'
,p_button_condition=>'P36_ZDARZENIEMECZID'
,p_button_condition_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(305607652418948004)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(830383515413965180)
,p_button_name=>'Zapisz'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(167807991445663116)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Zapisz'
,p_button_position=>'NEXT'
,p_button_condition=>'P36_ZDARZENIEMECZID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(305617368924948017)
,p_branch_name=>'Go To Page 32'
,p_branch_action=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(304836867723072941)
,p_name=>'P36_ZMIANAID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_item_source_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_source=>'ZMIANAID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(304837052728072943)
,p_name=>'P36_ZAWODNIKSCHODZACY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_item_source_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_prompt=>unistr('Zawodnik schodz\0105cy')
,p_source=>'ZAWODNIKSCHODZACY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    Z.Imie || '' '' || Z.Nazwisko || '' ('' || K.NAZWA || '') '' AS DISPLAY_VALUE,',
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
'    S.MeczID = :P36_MECZID',
'    AND S.Rolawskladzie = ''P''',
'ORDER BY',
'    K.Nazwa,',
'    Z.Imie,',
'    Z.Nazwisko'))
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
 p_id=>wwv_flow_imp.id(304837124830072944)
,p_name=>'P36_ZAWODNIKWCHODZACY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_item_source_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_prompt=>unistr('Zawodnik wchodz\0105cy')
,p_source=>'ZAWODNIKWCHODZACY'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    Z.Imie || '' '' || Z.Nazwisko || '' ('' || K.NAZWA || '') '' AS DISPLAY_VALUE,',
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
'    S.MeczID = :P36_MECZID',
'    AND S.Rolawskladzie = ''R''',
'    AND (',
'        (:P36_ZESPOL IS NULL)',
'        OR K.Nazwa = :P36_ZESPOL',
'    )',
'ORDER BY',
'    K.Nazwa,',
'    Z.Imie,',
'    Z.Nazwisko'))
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
 p_id=>wwv_flow_imp.id(830387488812965178)
,p_name=>'P36_KLUBGOSPID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_item_source_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_source=>'KLUBGOSPID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(830387593874965179)
,p_name=>'P36_KLUBGOSCID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_item_source_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_source=>'KLUBGOSCID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(830389859299965201)
,p_name=>'P36_MECZID'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_item_source_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_source=>'MECZID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(830405233547971581)
,p_name=>'P36_ZDARZENIEMECZID'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_item_source_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_source=>'ZDARZENIEMECZID'
,p_source_type=>'REGION_SOURCE_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(830406450455971583)
,p_name=>'P36_MINUTA'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_item_source_plug_id=>wwv_flow_imp.id(830399706302971571)
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
 p_id=>wwv_flow_imp.id(895080774722594194)
,p_name=>'P36_SEDZIAGLOWNYID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(830399706302971571)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sedziaglownyid ',
'from mecz',
'where meczid = :P32_MECZID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(459720857467818445)
,p_validation_name=>'Walidacja_minuta_notnull'
,p_validation_sequence=>10
,p_validation=>'P36_MINUTA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wpisa\0107 minut\0119 w pole "Minuta".')
,p_associated_item=>wwv_flow_imp.id(830406450455971583)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(459720931675818446)
,p_validation_name=>'Walidacja_Minuta_NUMER'
,p_validation_sequence=>20
,p_validation=>'P36_MINUTA'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('Prosz\0119 wpisa\0107 liczb\0119 w pole "Minuta".')
,p_associated_item=>wwv_flow_imp.id(830406450455971583)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(459721051715818447)
,p_validation_name=>'Walidacja_minuta1_90'
,p_validation_sequence=>30
,p_validation=>':P36_MINUTA BETWEEN 1 AND 90'
,p_validation2=>'PLSQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>unistr('Minuta gola musi by\0107 mi\0119dzy 1 a 90.')
,p_associated_item=>wwv_flow_imp.id(830406450455971583)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(459721154992818448)
,p_validation_name=>'Schodzacynotnull'
,p_validation_sequence=>40
,p_validation=>'P36_ZAWODNIKSCHODZACY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wybra\0107 zawodnika schodz\0105cego.')
,p_associated_item=>wwv_flow_imp.id(304837052728072943)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(459721292006818449)
,p_validation_name=>'wchodzacyzawodniknotnull'
,p_validation_sequence=>50
,p_validation=>'P36_ZAWODNIKWCHODZACY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Prosz\0119 wybra\0107 zawodnika schodz\0105cego.')
,p_associated_item=>wwv_flow_imp.id(304837124830072944)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(459721390073818450)
,p_validation_name=>'New'
,p_validation_sequence=>60
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_klub_schodzacy NUMBER;',
'    v_klub_wchodzacy NUMBER;',
'BEGIN',
unistr('    -- Je\017Celi itemy s\0105 puste (np. brak wyboru), mo\017Cesz od razu RETURN TRUE,'),
unistr('    --   chyba \017Ce chcesz uzna\0107 to za b\0142\0105d.'),
'    IF :P36_ZAWODNIKSCHODZACY IS NULL ',
'       OR :P36_ZAWODNIKWCHODZACY IS NULL THEN',
'       RETURN TRUE; ',
'    END IF;',
'',
'    SELECT KlubID',
'      INTO v_klub_schodzacy',
'      FROM Zawodnik',
'     WHERE ZawodnikID = :P36_ZAWODNIKSCHODZACY;',
'',
'    SELECT KlubID',
'      INTO v_klub_wchodzacy',
'      FROM Zawodnik',
'     WHERE ZawodnikID = :P36_ZAWODNIKWCHODZACY;',
'',
unistr('    -- Zwracamy TRUE, je\015Bli kluby s\0105 takie same; FALSE, je\015Bli inne'),
'    IF v_klub_schodzacy = v_klub_wchodzacy THEN',
'       RETURN TRUE;',
'    ELSE',
'       RETURN FALSE;',
'    END IF;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>unistr('Zawodnik wchodz\0105cy i schodz\0105cy musz\0105 by\0107 z tego samego klubu!')
,p_associated_item=>wwv_flow_imp.id(304837124830072944)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(305616350366948016)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P36_ZESPOL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(305616872579948016)
,p_event_id=>wwv_flow_imp.id(305616350366948016)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'aa'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(830399706302971571)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(305615128281948015)
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
'    :P36_MECZID,',
'    :P36_SEDZIAGLOWNYID,',
'    :P36_MINUTA,',
'    ''Zmiana''',
');',
'',
'INSERT INTO ZdarzenieMeczZmiana (',
'    ZdarzenieMeczID, ',
'    ZawodnikWchodzacyID, ',
'    ZawodnikSchodzacyID',
'',
') ',
'VALUES (',
'    (SELECT MAX(ZdarzenieMeczID) FROM ZdarzenieMecz), ',
'    :P36_ZAWODNIKWCHODZACY, ',
'    :P36_ZAWODNIKSCHODZACY',
');',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(305608086534948004)
,p_internal_uid=>305615128281948015
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(305615554347948015)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Zapisz'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'UPDATE ZdarzenieMeczZmiana',
'SET ',
'    ZawodnikWchodzacyID = :P36_ZAWODNIKWCHODZACY, ',
'    ZawodnikSchodzacyID = :P36_ZAWODNIKSCHODZACY',
'WHERE ',
'    ZmianaID = :P36_ZmianaID;',
'',
'UPDATE ZdarzenieMecz ',
'SET ',
'    Minuta= :P36_MINUTA',
'WHERE',
'    ZdarzenieMeczID = :P36_ZDARZENIEMECZID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(305607652418948004)
,p_internal_uid=>305615554347948015
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(305615926445948015)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Usu\0144')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM ZdarzenieMeczZmiana',
'WHERE ZmianaID = :P36_ZmianaID;',
'DELETE FROM ZdarzenieMecz ',
'WHERE ZdarzenieMeczID = :P36_ZDARZENIEMECZID;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(305606843111948001)
,p_internal_uid=>305615926445948015
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(305614607140948014)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(830399706302971571)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form FormGol'
,p_internal_uid=>305614607140948014
);
wwv_flow_imp.component_end;
end;
/
