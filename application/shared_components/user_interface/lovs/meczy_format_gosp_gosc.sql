prompt --application/shared_components/user_interface/lovs/meczy_format_gosp_gosc
begin
--   Manifest
--     MECZY_FORMAT_GOSP_GOSC
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
 p_id=>wwv_flow_imp.id(174893024614879805)
,p_lov_name=>'MECZY_FORMAT_GOSP_GOSC'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    (K1.nazwa || '' - '' || K2.nazwa) AS primary_label,',
'    TO_CHAR(M.DataMeczu, ''DD-MM-YYYY'') AS secondary_label,',
'    M.MeczID AS MeczID',
'FROM',
'    Mecz M',
'    JOIN Klub K1 ON M.KlubGospID = K1.KlubID',
'    JOIN Klub K2 ON M.KlubGoscID = K2.KlubID',
'ORDER BY',
'    M.DataMeczu;',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'MECZID'
,p_display_column_name=>'PRIMARY_LABEL'
,p_version_scn=>444973651
);
wwv_flow_imp.component_end;
end;
/
