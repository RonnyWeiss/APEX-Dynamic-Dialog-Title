prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_210200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2016.08.24'
,p_release=>'5.1.3.00.05'
,p_default_workspace_id=>100000
,p_default_application_id=>55310
,p_default_id_offset=>22598797485307386842
,p_default_owner=>'RONNY'
);
end;
/

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/dynamic_action/rw_apex_dynamic_dialog_title
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(45227022029372902468)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'RW.APEX.DYNAMIC.DIALOG.TITLE'
,p_display_name=>'APEX Dynamic Dialog Title'
,p_category=>'STYLE'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'FUNCTION F_RENDER (',
'    P_DYNAMIC_ACTION   IN   APEX_PLUGIN.T_DYNAMIC_ACTION,',
'    P_PLUGIN           IN   APEX_PLUGIN.T_PLUGIN',
') RETURN APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT AS',
'',
'    VR_RESULT            APEX_PLUGIN.T_DYNAMIC_ACTION_RENDER_RESULT;',
'    VR_FUNCTION_RESULT   P_DYNAMIC_ACTION.ATTRIBUTE_01%TYPE := APEX_PLUGIN_UTIL.GET_PLSQL_FUNCTION_RESULT(P_PLSQL_FUNCTION => P_DYNAMIC_ACTION.ATTRIBUTE_01);',
'BEGIN',
'',
'    VR_RESULT.JAVASCRIPT_FUNCTION := ''function () { apex.util.getTopApex().jQuery(".ui-dialog-content").last().dialog("option", "title", '' ||',
'    APEX_JAVASCRIPT.ADD_VALUE(',
'        P_VALUE       => VR_FUNCTION_RESULT,',
'        P_ADD_COMMA   => FALSE',
'    ) ||',
'    ''); }'';',
'',
'    RETURN VR_RESULT;',
'END;'))
,p_api_version=>2
,p_render_function=>'F_RENDER'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_help_text=>'This plug-in is used to set a dynamic modal dialog title on dialog render. Just add this Plug-in to a Dynamic Action that is fired on Page Load.'
,p_version_identifier=>'1.1'
,p_about_url=>'https://github.com/RonnyWeiss/APEX-Dynamic-Dialog-Title'
,p_files_version=>10
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(45228854886369960522)
,p_plugin_id=>wwv_flow_api.id(45227022029372902468)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Get dynamic Title Function'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_default_value=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    VR_RET VARCHAR2(4000 CHAR) := NULL;',
'BEGIN',
'    SELECT',
'        ''My app user name is '' || :APP_USER',
'    INTO VR_RET',
'    FROM',
'        DUAL;',
'',
'    RETURN VR_RET;',
'END;'))
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'DECLARE',
'    VR_RET VARCHAR2(4000 CHAR) := NULL;',
'BEGIN',
'    SELECT',
'        ''My app user name is '' || :APP_USER',
'    INTO VR_RET',
'    FROM',
'        DUAL;',
'',
'    RETURN VR_RET;',
'END;',
'</pre>'))
,p_help_text=>'Enter here a function that return the dynamic title as VARCHAR2'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '43432042592D4E4420342E30204C6963656E73650A0A436F7079726967687420286329203230323020526F6E6E792057656973730A0A5468697320776F726B206973206C6963656E73656420756E6465722074686520437265617469766520436F6D6D6F';
wwv_flow_api.g_varchar2_table(2) := '6E73204174747269627574696F6E2D4E6F446572697661746976657320342E3020496E7465726E6174696F6E616C204C6963656E73652E0A0A546F2076696577206120636F7079206F662074686973206C6963656E73652C20766973697420687474703A';
wwv_flow_api.g_varchar2_table(3) := '2F2F6372656174697665636F6D6D6F6E732E6F72672F6C6963656E7365732F62792D6E642F342E302F206F722073656E642061206C657474657220746F20437265617469766520436F6D6D6F6E732C20504F20426F7820313836362C204D6F756E746169';
wwv_flow_api.g_varchar2_table(4) := '6E20566965772C2043412039343034322C205553412E';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(45227030144482902500)
,p_plugin_id=>wwv_flow_api.id(45227022029372902468)
,p_file_name=>'LICENSE'
,p_mime_type=>'application/octet-stream'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
