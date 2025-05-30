prompt --application/shared_components/user_interface/lovs/mecz_wynikkoncowy
begin
--   Manifest
--     MECZ.WYNIKKONCOWY
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
 p_id=>wwv_flow_imp.id(168006718957663560)
,p_lov_name=>'MECZ.WYNIKKONCOWY'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'MECZ'
,p_return_column_name=>'MECZID'
,p_display_column_name=>'WYNIKKONCOWY'
,p_default_sort_column_name=>'WYNIKKONCOWY'
,p_default_sort_direction=>'ASC'
,p_version_scn=>443185100
);
wwv_flow_imp.component_end;
end;
/
