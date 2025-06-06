prompt --application/create_application
begin
--   Manifest
--     FLOW: 236
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>47527763449748886
,p_default_application_id=>236
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WS155830'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'WKSP_WS155830')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Liga')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'LIGA236')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'22EB6BA7BF3475F2BA6C34393465A1BC38DE9AD14EB76D032D7475D081B1141B'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'21.2'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'YYYY-MM-DD'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix => nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(195813991967494051)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'Liga'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_flow_unavailable_text=>'This application is currently unavailable at this time.'
,p_exact_substitutions_only=>'Y'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_runtime_api_usage=>'T:W'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_auto_time_zone=>'N'
,p_error_handling_function=>'insum_error_handler_api.error_handler'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Liga'
,p_file_prefix => nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>11
,p_print_server_type=>'NATIVE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'N'
,p_pwa_is_push_enabled=>'N'
);
wwv_flow_imp.component_end;
end;
/
