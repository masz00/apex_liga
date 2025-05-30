prompt --application/plugin_settings
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>47527763449748886
,p_default_application_id=>236
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WS155830'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(167626565000662959)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>443179470
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(167626827231662959)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
,p_version_scn=>443179470
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(167627107887662959)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>443179470
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(167627422588662960)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attribute_01=>'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON'
,p_attribute_02=>'VISIBLE'
,p_attribute_03=>'15'
,p_attribute_04=>'FOCUS'
,p_version_scn=>443179470
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(167627712704662960)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_attribute_02=>'N'
,p_attribute_03=>'POPUP:ITEM'
,p_attribute_04=>'default'
,p_attribute_06=>'LIST'
,p_version_scn=>443179470
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(167628080824662960)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>443179470
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(167628303464662961)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>443179470
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(167628627941662961)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>443179470
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(167628931565662961)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attribute_01=>'separated'
,p_version_scn=>443179470
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(167629201757662961)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attribute_01=>'FULL'
,p_attribute_02=>'POPUP'
,p_version_scn=>443179470
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(167629524282662962)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attribute_01=>'fa-star'
,p_attribute_04=>'#VALUE#'
,p_version_scn=>443179470
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(167629865026662962)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attribute_01=>'Y'
,p_attribute_03=>'N'
,p_attribute_05=>'SWITCH_CB'
,p_version_scn=>443179471
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(167630171598662962)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_version_scn=>443179471
);
wwv_flow_imp.component_end;
end;
/
