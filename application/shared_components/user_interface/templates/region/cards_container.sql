prompt --application/shared_components/user_interface/templates/region/cards_container
begin
--   Manifest
--     REGION TEMPLATE: CARDS_CONTAINER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.4'
,p_default_workspace_id=>47527763449748886
,p_default_application_id=>236
,p_default_id_offset=>0
,p_default_owner=>'WKSP_WS155830'
);
wwv_flow_imp_shared.create_plug_template(
 p_id=>wwv_flow_imp.id(167674828502663005)
,p_layout=>'TABLE'
,p_template=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="t-CardsRegion #REGION_CSS_CLASSES#" id="#REGION_STATIC_ID#" #REGION_LANDMARK_ATTRIBUTES# #REGION_ATTRIBUTES#>',
'  <div class="t-Region-orderBy">#ORDER_BY_ITEM#</div>',
'  #BODY#',
'  #SUB_REGIONS#',
'</div>'))
,p_page_plug_template_name=>'Cards Container'
,p_internal_name=>'CARDS_CONTAINER'
,p_theme_id=>42
,p_theme_class_id=>21
,p_default_template_options=>'u-colors'
,p_default_label_alignment=>'RIGHT'
,p_default_field_alignment=>'LEFT'
,p_default_landmark_type=>'region'
,p_reference_id=>2071277712695139743
,p_translate_this_template=>'N'
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(167675135150663006)
,p_plug_template_id=>wwv_flow_imp.id(167674828502663005)
,p_name=>'Region Body'
,p_placeholder=>'BODY'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(167675407548663006)
,p_plug_template_id=>wwv_flow_imp.id(167674828502663005)
,p_name=>'Sort Order'
,p_placeholder=>'ORDER_BY_ITEM'
,p_has_grid_support=>false
,p_has_region_support=>false
,p_has_item_support=>true
,p_has_button_support=>true
,p_glv_new_row=>true
);
wwv_flow_imp_shared.create_plug_tmpl_display_point(
 p_id=>wwv_flow_imp.id(167675787370663006)
,p_plug_template_id=>wwv_flow_imp.id(167674828502663005)
,p_name=>'Sub Regions'
,p_placeholder=>'SUB_REGIONS'
,p_has_grid_support=>true
,p_has_region_support=>true
,p_has_item_support=>false
,p_has_button_support=>false
,p_glv_new_row=>true
);
wwv_flow_imp.component_end;
end;
/
