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
,p_version_identifier=>'23.01.12'
,p_about_url=>'https://github.com/RonnyWeiss/APEX-Dynamic-Dialog-Title'
,p_files_version=>11
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
wwv_flow_api.g_varchar2_table(1) := '4D4954204C6963656E73650A0A436F7079726967687420286329203230323320526F6E6E792057656973730A0A5065726D697373696F6E20697320686572656279206772616E7465642C2066726565206F66206368617267652C20746F20616E79207065';
wwv_flow_api.g_varchar2_table(2) := '72736F6E206F627461696E696E67206120636F70790A6F66207468697320736F66747761726520616E64206173736F63696174656420646F63756D656E746174696F6E2066696C657320287468652022536F66747761726522292C20746F206465616C0A';
wwv_flow_api.g_varchar2_table(3) := '696E2074686520536F66747761726520776974686F7574207265737472696374696F6E2C20696E636C7564696E6720776974686F7574206C696D69746174696F6E20746865207269676874730A746F207573652C20636F70792C206D6F646966792C206D';
wwv_flow_api.g_varchar2_table(4) := '657267652C207075626C6973682C20646973747269627574652C207375626C6963656E73652C20616E642F6F722073656C6C0A636F70696573206F662074686520536F6674776172652C20616E6420746F207065726D697420706572736F6E7320746F20';
wwv_flow_api.g_varchar2_table(5) := '77686F6D2074686520536F6674776172652069730A6675726E697368656420746F20646F20736F2C207375626A65637420746F2074686520666F6C6C6F77696E6720636F6E646974696F6E733A0A0A5468652061626F766520636F70797269676874206E';
wwv_flow_api.g_varchar2_table(6) := '6F7469636520616E642074686973207065726D697373696F6E206E6F74696365207368616C6C20626520696E636C7564656420696E20616C6C0A636F70696573206F72207375627374616E7469616C20706F7274696F6E73206F662074686520536F6674';
wwv_flow_api.g_varchar2_table(7) := '776172652E0A0A54484520534F4654574152452049532050524F564944454420224153204953222C20574954484F55542057415252414E5459204F4620414E59204B494E442C2045585052455353204F520A494D504C4945442C20494E434C5544494E47';
wwv_flow_api.g_varchar2_table(8) := '20425554204E4F54204C494D4954454420544F205448452057415252414E54494553204F46204D45524348414E544142494C4954592C0A4649544E45535320464F52204120504152544943554C415220505552504F534520414E44204E4F4E494E465249';
wwv_flow_api.g_varchar2_table(9) := '4E47454D454E542E20494E204E4F204556454E54205348414C4C205448450A415554484F5253204F5220434F5059524947485420484F4C44455253204245204C4941424C4520464F5220414E5920434C41494D2C2044414D41474553204F52204F544845';
wwv_flow_api.g_varchar2_table(10) := '520A4C494142494C4954592C205748455448455220494E20414E20414354494F4E204F4620434F4E54524143542C20544F5254204F52204F54484552574953452C2041524953494E472046524F4D2C0A4F5554204F46204F5220494E20434F4E4E454354';
wwv_flow_api.g_varchar2_table(11) := '494F4E20574954482054484520534F465457415245204F522054484520555345204F52204F54484552204445414C494E475320494E205448450A534F4654574152452E0A';
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
