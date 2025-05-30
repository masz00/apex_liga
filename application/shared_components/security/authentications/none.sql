prompt --application/shared_components/security/authentications/none
begin
--   Manifest
--     AUTHENTICATION: None
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>47527763449748886
,p_default_application_id=>236
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WS155830'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(195813991967494051)
,p_name=>'None'
,p_scheme_type=>'NATIVE_DAD'
,p_attribute_01=>'nobody'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>449055730
);
wwv_flow_imp.component_end;
end;
/
