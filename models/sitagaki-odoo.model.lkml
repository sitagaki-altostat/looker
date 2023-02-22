# Define the database connection to be used for this model.
connection: "looker-private-demo-1"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: sitagaki-odoo_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: sitagaki-odoo_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Sitagaki-odoo"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: account_analytic_plan {}

explore: account_analytic_account {}

explore: barcode_rule {
  join: barcode_nomenclature {
    type: left_outer
    sql_on: ${barcode_rule.barcode_nomenclature_id} = ${barcode_nomenclature.id} ;;
    relationship: many_to_one
  }
}

explore: barcode_nomenclature {}

explore: decimal_precision {}

explore: bus_presence {}

explore: base_language_install {}

explore: bus_bus {}

explore: digest_digest {}

explore: digest_tip_res_users_rel {
  join: res_users {
    type: left_outer
    sql_on: ${digest_tip_res_users_rel.res_users_id} = ${res_users.id} ;;
    relationship: many_to_one
  }

  join: digest_tip {
    type: left_outer
    sql_on: ${digest_tip_res_users_rel.digest_tip_id} = ${digest_tip.id} ;;
    relationship: many_to_one
  }
}

explore: digest_digest_res_users_rel {
  join: res_users {
    type: left_outer
    sql_on: ${digest_digest_res_users_rel.res_users_id} = ${res_users.id} ;;
    relationship: many_to_one
  }

  join: digest_digest {
    type: left_outer
    sql_on: ${digest_digest_res_users_rel.digest_digest_id} = ${digest_digest.id} ;;
    relationship: many_to_one
  }
}

explore: gamification_challenge_line {}

explore: employee_category_rel {}

explore: digest_tip {}

explore: gamification_challenge {}

explore: gamification_badge {}

explore: gamification_goal_definition {}

explore: gamification_karma_rank {}

explore: gamification_challenge_users_rel {
  join: gamification_challenge {
    type: left_outer
    sql_on: ${gamification_challenge_users_rel.gamification_challenge_id} = ${gamification_challenge.id} ;;
    relationship: many_to_one
  }

  join: res_users {
    type: left_outer
    sql_on: ${gamification_challenge_users_rel.res_users_id} = ${res_users.id} ;;
    relationship: many_to_one
  }
}

explore: gamification_goal {}

explore: hr_contract_type {}

explore: hr_department {}

explore: hr_departure_reason {}

explore: gamification_karma_tracking {}

explore: hr_employee_category {}

explore: hr_plan {}

explore: hr_plan_activity_type {}

explore: hr_work_location {}

explore: hr_employee {
  join: resource_calendar {
    type: left_outer
    sql_on: ${hr_employee.resource_calendar_id} = ${resource_calendar.id} ;;
    relationship: many_to_one
  }
}

explore: hr_job {}

explore: ir_act_client {}

explore: ir_act_report_xml {}

explore: ir_act_server_group_rel {}

explore: ir_act_url {}

explore: ir_act_window_group_rel {}

explore: ir_act_server {
  join: sms_template {
    type: left_outer
    sql_on: ${ir_act_server.sms_template_id} = ${sms_template.id} ;;
    relationship: many_to_one
  }
}

explore: ir_act_window {}

explore: ir_act_window_view {}

explore: ir_actions {}

explore: ir_actions_todo {}

explore: ir_asset {}

explore: ir_attachment {}

explore: ir_config_parameter {}

explore: ir_default {}

explore: ir_cron {}

explore: ir_model_access {}

explore: ir_model {}

explore: ir_model_constraint {}

explore: ir_model_data {}

explore: ir_model_fields {}

explore: ir_model_fields_selection {}

explore: ir_model_relation {}

explore: ir_module_module {}

explore: ir_module_category {}

explore: ir_module_module_dependency {}

explore: ir_property {}

explore: ir_rule {}

explore: ir_sequence {}

explore: ir_ui_menu_group_rel {}

explore: ir_ui_menu {}

explore: ir_ui_view {}

explore: mail_activity {}

explore: ir_ui_view_group_rel {}

explore: mail_activity_type {}

explore: mail_alias {}

explore: mail_blacklist {}

explore: mail_channel {}

explore: mail_channel_member {}

explore: mail_compose_message {
  join: mail_activity_type {
    type: left_outer
    sql_on: ${mail_compose_message.mail_activity_type_id} = ${mail_activity_type.id} ;;
    relationship: many_to_one
  }
}

explore: mail_channel_res_groups_rel {
  join: mail_channel {
    type: left_outer
    sql_on: ${mail_channel_res_groups_rel.mail_channel_id} = ${mail_channel.id} ;;
    relationship: many_to_one
  }

  join: res_groups {
    type: left_outer
    sql_on: ${mail_channel_res_groups_rel.res_groups_id} = ${res_groups.id} ;;
    relationship: many_to_one
  }
}

explore: mail_followers {}

explore: mail_followers_mail_message_subtype_rel {
  join: mail_message_subtype {
    type: left_outer
    sql_on: ${mail_followers_mail_message_subtype_rel.mail_message_subtype_id} = ${mail_message_subtype.id} ;;
    relationship: many_to_one
  }

  join: mail_followers {
    type: left_outer
    sql_on: ${mail_followers_mail_message_subtype_rel.mail_followers_id} = ${mail_followers.id} ;;
    relationship: many_to_one
  }
}

explore: mail_mail {
  join: mail_message {
    type: left_outer
    sql_on: ${mail_mail.mail_message_id} = ${mail_message.id} ;;
    relationship: many_to_one
  }

  join: mail_activity_type {
    type: left_outer
    sql_on: ${mail_message.mail_activity_type_id} = ${mail_activity_type.id} ;;
    relationship: many_to_one
  }
}

explore: mail_message {
  join: mail_activity_type {
    type: left_outer
    sql_on: ${mail_message.mail_activity_type_id} = ${mail_activity_type.id} ;;
    relationship: many_to_one
  }
}

explore: mail_message_res_partner_rel {
  join: res_partner {
    type: left_outer
    sql_on: ${mail_message_res_partner_rel.res_partner_id} = ${res_partner.id} ;;
    relationship: many_to_one
  }

  join: mail_message {
    type: left_outer
    sql_on: ${mail_message_res_partner_rel.mail_message_id} = ${mail_message.id} ;;
    relationship: many_to_one
  }

  join: mail_activity_type {
    type: left_outer
    sql_on: ${mail_message.mail_activity_type_id} = ${mail_activity_type.id} ;;
    relationship: many_to_one
  }
}

explore: mail_message_subtype {}

explore: mail_notification {
  join: mail_message {
    type: left_outer
    sql_on: ${mail_notification.mail_message_id} = ${mail_message.id} ;;
    relationship: many_to_one
  }

  join: res_partner {
    type: left_outer
    sql_on: ${mail_notification.res_partner_id} = ${res_partner.id} ;;
    relationship: many_to_one
  }

  join: mail_mail {
    type: left_outer
    sql_on: ${mail_notification.mail_mail_id} = ${mail_mail.id} ;;
    relationship: many_to_one
  }

  join: mail_activity_type {
    type: left_outer
    sql_on: ${mail_message.mail_activity_type_id} = ${mail_activity_type.id} ;;
    relationship: many_to_one
  }
}

explore: mail_template {}

explore: mail_tracking_value {
  join: mail_message {
    type: left_outer
    sql_on: ${mail_tracking_value.mail_message_id} = ${mail_message.id} ;;
    relationship: many_to_one
  }

  join: mail_activity_type {
    type: left_outer
    sql_on: ${mail_message.mail_activity_type_id} = ${mail_activity_type.id} ;;
    relationship: many_to_one
  }
}

explore: mailing_contact {}

explore: mailing_contact_list_rel {}

explore: mailing_mailing {}

explore: mailing_list {}

explore: mailing_trace {
  join: mail_mail {
    type: left_outer
    sql_on: ${mailing_trace.mail_mail_id} = ${mail_mail.id} ;;
    relationship: many_to_one
  }

  join: mail_message {
    type: left_outer
    sql_on: ${mail_mail.mail_message_id} = ${mail_message.id} ;;
    relationship: many_to_one
  }

  join: mail_activity_type {
    type: left_outer
    sql_on: ${mail_message.mail_activity_type_id} = ${mail_activity_type.id} ;;
    relationship: many_to_one
  }
}

explore: mass_mailing_ir_attachments_rel {}

explore: product_attribute {}

explore: product_attribute_value {}

explore: product_attribute_product_template_rel {
  join: product_template {
    type: left_outer
    sql_on: ${product_attribute_product_template_rel.product_template_id} = ${product_template.id} ;;
    relationship: many_to_one
  }

  join: product_attribute {
    type: left_outer
    sql_on: ${product_attribute_product_template_rel.product_attribute_id} = ${product_attribute.id} ;;
    relationship: many_to_one
  }
}

explore: product_attribute_value_product_template_attribute_line_rel {
  join: product_template_attribute_line {
    type: left_outer
    sql_on: ${product_attribute_value_product_template_attribute_line_rel.product_template_attribute_line_id} = ${product_template_attribute_line.id} ;;
    relationship: many_to_one
  }

  join: product_attribute_value {
    type: left_outer
    sql_on: ${product_attribute_value_product_template_attribute_line_rel.product_attribute_value_id} = ${product_attribute_value.id} ;;
    relationship: many_to_one
  }
}

explore: product_pricelist {}

explore: product_category {}

explore: product_product {}

explore: product_removal {}

explore: product_supplierinfo {}

explore: product_template {}

explore: product_template_attribute_line {}

explore: product_template_attribute_value {
  join: product_attribute_value {
    type: left_outer
    sql_on: ${product_template_attribute_value.product_attribute_value_id} = ${product_attribute_value.id} ;;
    relationship: many_to_one
  }
}

explore: project_favorite_user_rel {}

explore: product_variant_combination {
  join: product_template_attribute_value {
    type: left_outer
    sql_on: ${product_variant_combination.product_template_attribute_value_id} = ${product_template_attribute_value.id} ;;
    relationship: many_to_one
  }

  join: product_product {
    type: left_outer
    sql_on: ${product_variant_combination.product_product_id} = ${product_product.id} ;;
    relationship: many_to_one
  }

  join: product_attribute_value {
    type: left_outer
    sql_on: ${product_template_attribute_value.product_attribute_value_id} = ${product_attribute_value.id} ;;
    relationship: many_to_one
  }
}

explore: project_milestone {}

explore: project_project {}

explore: project_project_project_tags_rel {
  join: project_tags {
    type: left_outer
    sql_on: ${project_project_project_tags_rel.project_tags_id} = ${project_tags.id} ;;
    relationship: many_to_one
  }

  join: project_project {
    type: left_outer
    sql_on: ${project_project_project_tags_rel.project_project_id} = ${project_project.id} ;;
    relationship: many_to_one
  }
}

explore: project_tags {}

explore: project_project_stage {
  join: sms_template {
    type: left_outer
    sql_on: ${project_project_stage.sms_template_id} = ${sms_template.id} ;;
    relationship: many_to_one
  }

  join: mail_template {
    type: left_outer
    sql_on: ${project_project_stage.mail_template_id} = ${mail_template.id} ;;
    relationship: many_to_one
  }
}

explore: project_tags_project_task_rel {
  join: project_tags {
    type: left_outer
    sql_on: ${project_tags_project_task_rel.project_tags_id} = ${project_tags.id} ;;
    relationship: many_to_one
  }

  join: project_task {
    type: left_outer
    sql_on: ${project_tags_project_task_rel.project_task_id} = ${project_task.id} ;;
    relationship: many_to_one
  }
}

explore: project_task_recurrence {}

explore: project_task {}

explore: project_task_type {
  join: sms_template {
    type: left_outer
    sql_on: ${project_task_type.sms_template_id} = ${sms_template.id} ;;
    relationship: many_to_one
  }

  join: mail_template {
    type: left_outer
    sql_on: ${project_task_type.mail_template_id} = ${mail_template.id} ;;
    relationship: many_to_one
  }
}

explore: project_task_type_rel {}

explore: project_task_user_rel {}

explore: project_update {}

explore: rating_rating {}

explore: report_layout {}

explore: report_paperformat {}

explore: res_bank {}

explore: res_company {
  join: resource_calendar {
    type: left_outer
    sql_on: ${res_company.resource_calendar_id} = ${resource_calendar.id} ;;
    relationship: many_to_one
  }
}

explore: res_company_users_rel {}

explore: res_country {}

explore: res_country_group {}

explore: res_country_res_country_group_rel {
  join: res_country_group {
    type: left_outer
    sql_on: ${res_country_res_country_group_rel.res_country_group_id} = ${res_country_group.id} ;;
    relationship: many_to_one
  }

  join: res_country {
    type: left_outer
    sql_on: ${res_country_res_country_group_rel.res_country_id} = ${res_country.id} ;;
    relationship: many_to_one
  }
}

explore: res_country_state {}

explore: res_currency {}

explore: res_currency_rate {}

explore: res_groups {}

explore: res_groups_implied_rel {}

explore: res_groups_report_rel {}

explore: res_groups_users_rel {}

explore: res_lang {}

explore: res_lang_install_rel {}

explore: res_partner {}

explore: res_partner_bank {}

explore: res_partner_category {}

explore: res_partner_res_partner_category_rel {}

explore: res_partner_industry {}

explore: res_partner_title {}

explore: res_users {}

explore: res_users_log {}

explore: res_users_settings {}

explore: resource_calendar {}

explore: resource_calendar_attendance {}

explore: resource_resource {}

explore: rule_group_rel {}

explore: sms_template {}

explore: stock_immediate_transfer {}

explore: stock_immediate_transfer_line {}

explore: stock_location {}

explore: stock_lot {}

explore: stock_move {}

explore: stock_move_line {}

explore: stock_package_type {}

explore: stock_picking_transfer_rel {
  join: stock_immediate_transfer {
    type: left_outer
    sql_on: ${stock_picking_transfer_rel.stock_immediate_transfer_id} = ${stock_immediate_transfer.id} ;;
    relationship: many_to_one
  }

  join: stock_picking {
    type: left_outer
    sql_on: ${stock_picking_transfer_rel.stock_picking_id} = ${stock_picking.id} ;;
    relationship: many_to_one
  }
}

explore: stock_picking {}

explore: stock_picking_type {}

explore: stock_quant {}

explore: stock_route {}

explore: stock_route_warehouse {}

explore: stock_rule {}

explore: stock_storage_category {}

explore: stock_warehouse {}

explore: stock_warehouse_orderpoint {
  join: product_category {
    type: left_outer
    sql_on: ${stock_warehouse_orderpoint.product_category_id} = ${product_category.id} ;;
    relationship: many_to_one
  }
}

explore: survey_question {}

explore: survey_question_answer {}

explore: survey_question_survey_user_input_rel {
  join: survey_question {
    type: left_outer
    sql_on: ${survey_question_survey_user_input_rel.survey_question_id} = ${survey_question.id} ;;
    relationship: many_to_one
  }

  join: survey_user_input {
    type: left_outer
    sql_on: ${survey_question_survey_user_input_rel.survey_user_input_id} = ${survey_user_input.id} ;;
    relationship: many_to_one
  }
}

explore: survey_survey {}

explore: survey_user_input {}

explore: survey_user_input_line {}

explore: uom_category {}

explore: task_dependencies_rel {}

explore: utm_campaign {}

explore: uom_uom {}

explore: utm_medium {}

explore: utm_source {}

explore: utm_stage {}

explore: utm_tag {}

explore: utm_tag_rel {}
