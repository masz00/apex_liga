prompt --application/shared_components/user_interface/lovs/klub_nazwa
begin
--   Manifest
--     KLUB.NAZWA
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>47527763449748886
,p_default_application_id=>236
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WS155830'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(167972589134663447)
,p_lov_name=>'KLUB.NAZWA'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'KLUB'
,p_return_column_name=>'KLUBID'
,p_display_column_name=>'NAZWA'
,p_default_sort_column_name=>'NAZWA'
,p_default_sort_direction=>'ASC'
,p_version_scn=>443185074
);
wwv_flow_imp.component_end;
end;
/
