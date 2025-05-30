prompt --application/shared_components/user_interface/lovs/trener_imie_nazwisko
begin
--   Manifest
--     TRENER_IMIE_NAZWISKO
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
 p_id=>wwv_flow_imp.id(174862859057223529)
,p_lov_name=>'TRENER_IMIE_NAZWISKO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT IMIE || '' '' || NAZWISKO AS imie_nazwisko,',
'       TRENERID',
'FROM TRENER',
'ORDER BY imie_nazwisko;',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TRENERID'
,p_display_column_name=>'IMIE_NAZWISKO'
,p_group_sort_direction=>'ASC'
,p_default_sort_direction=>'ASC'
,p_version_scn=>444927158
);
wwv_flow_imp.component_end;
end;
/
