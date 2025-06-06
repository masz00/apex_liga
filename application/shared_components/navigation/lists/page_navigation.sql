prompt --application/shared_components/navigation/lists/page_navigation
begin
--   Manifest
--     LIST: Page Navigation
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>47527763449748886
,p_default_application_id=>236
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WS155830'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(168222220706664095)
,p_name=>'Page Navigation'
,p_list_status=>'PUBLIC'
,p_version_scn=>445071738
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(168222626479664096)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Klub'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(168223090084664096)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Liga'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(168223487222664096)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Mecz'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(168223882964664097)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Sedzia'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(168224695682664098)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Stadion'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(168225071471664098)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Trener'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(168225434680664098)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Zawodnik'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-table'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
