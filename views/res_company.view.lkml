# The name of this view in Looker is "Res Company"
view: res_company {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.res_company`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Active" in Explore.

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: annual_inventory_day {
    type: number
    sql: ${TABLE}.annual_inventory_day ;;
  }

  dimension: annual_inventory_month {
    type: string
    sql: ${TABLE}.annual_inventory_month ;;
  }

  dimension: base_onboarding_company_state {
    type: string
    sql: ${TABLE}.base_onboarding_company_state ;;
  }

  dimension: company_details {
    type: string
    sql: ${TABLE}.company_details ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: create {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.create_date ;;
  }

  dimension: create_uid {
    type: number
    value_format_name: id
    sql: ${TABLE}.create_uid ;;
  }

  dimension: currency_id {
    type: number
    sql: ${TABLE}.currency_id ;;
  }

  dimension: datastream_metadata__source_timestamp {
    type: number
    sql: ${TABLE}.datastream_metadata.source_timestamp ;;
    group_label: "Datastream Metadata"
    group_item_label: "Source Timestamp"
  }

  dimension: datastream_metadata__uuid {
    type: string
    sql: ${TABLE}.datastream_metadata.uuid ;;
    group_label: "Datastream Metadata"
    group_item_label: "Uuid"
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: external_report_layout_id {
    type: number
    sql: ${TABLE}.external_report_layout_id ;;
  }

  dimension: font {
    type: string
    sql: ${TABLE}.font ;;
  }

  dimension: has_received_warning_stock_sms {
    type: yesno
    sql: ${TABLE}.has_received_warning_stock_sms ;;
  }

  dimension: hr_presence_control_email_amount {
    type: number
    sql: ${TABLE}.hr_presence_control_email_amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_hr_presence_control_email_amount {
    type: sum
    sql: ${hr_presence_control_email_amount} ;;
  }

  measure: average_hr_presence_control_email_amount {
    type: average
    sql: ${hr_presence_control_email_amount} ;;
  }

  dimension: hr_presence_control_ip_list {
    type: string
    sql: ${TABLE}.hr_presence_control_ip_list ;;
  }

  dimension: iap_enrich_auto_done {
    type: yesno
    sql: ${TABLE}.iap_enrich_auto_done ;;
  }

  dimension: internal_transit_location_id {
    type: number
    sql: ${TABLE}.internal_transit_location_id ;;
  }

  dimension: layout_background {
    type: string
    sql: ${TABLE}.layout_background ;;
  }

  dimension: logo_web {
    type: string
    sql: ${TABLE}.logo_web ;;
  }

  dimension: mobile {
    type: string
    sql: ${TABLE}.mobile ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: nomenclature_id {
    type: number
    sql: ${TABLE}.nomenclature_id ;;
  }

  dimension: paperformat_id {
    type: number
    sql: ${TABLE}.paperformat_id ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: partner_gid {
    type: number
    value_format_name: id
    sql: ${TABLE}.partner_gid ;;
  }

  dimension: partner_id {
    type: number
    sql: ${TABLE}.partner_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: primary_color {
    type: string
    sql: ${TABLE}.primary_color ;;
  }

  dimension: report_footer {
    type: string
    sql: ${TABLE}.report_footer ;;
  }

  dimension: report_header {
    type: string
    sql: ${TABLE}.report_header ;;
  }

  dimension: resource_calendar_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.resource_calendar_id ;;
  }

  dimension: secondary_color {
    type: string
    sql: ${TABLE}.secondary_color ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: snailmail_color {
    type: yesno
    sql: ${TABLE}.snailmail_color ;;
  }

  dimension: snailmail_cover {
    type: yesno
    sql: ${TABLE}.snailmail_cover ;;
  }

  dimension: snailmail_duplex {
    type: yesno
    sql: ${TABLE}.snailmail_duplex ;;
  }

  dimension: social_facebook {
    type: string
    sql: ${TABLE}.social_facebook ;;
  }

  dimension: social_github {
    type: string
    sql: ${TABLE}.social_github ;;
  }

  dimension: social_instagram {
    type: string
    sql: ${TABLE}.social_instagram ;;
  }

  dimension: social_linkedin {
    type: string
    sql: ${TABLE}.social_linkedin ;;
  }

  dimension: social_twitter {
    type: string
    sql: ${TABLE}.social_twitter ;;
  }

  dimension: social_youtube {
    type: string
    sql: ${TABLE}.social_youtube ;;
  }

  dimension: stock_mail_confirmation_template_id {
    type: number
    sql: ${TABLE}.stock_mail_confirmation_template_id ;;
  }

  dimension: stock_move_email_validation {
    type: yesno
    sql: ${TABLE}.stock_move_email_validation ;;
  }

  dimension: stock_move_sms_validation {
    type: yesno
    sql: ${TABLE}.stock_move_sms_validation ;;
  }

  dimension: stock_sms_confirmation_template_id {
    type: number
    sql: ${TABLE}.stock_sms_confirmation_template_id ;;
  }

  dimension_group: write {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.write_date ;;
  }

  dimension: write_uid {
    type: number
    value_format_name: id
    sql: ${TABLE}.write_uid ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, resource_calendar.name, resource_calendar.id]
  }
}
