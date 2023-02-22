# The name of this view in Looker is "Ir Act Server"
view: ir_act_server {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.ir_act_server`
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
  # This dimension will be called "Activity Date Deadline Range" in Explore.

  dimension: activity_date_deadline_range {
    type: number
    sql: ${TABLE}.activity_date_deadline_range ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_activity_date_deadline_range {
    type: sum
    sql: ${activity_date_deadline_range} ;;
  }

  measure: average_activity_date_deadline_range {
    type: average
    sql: ${activity_date_deadline_range} ;;
  }

  dimension: activity_date_deadline_range_type {
    type: string
    sql: ${TABLE}.activity_date_deadline_range_type ;;
  }

  dimension: activity_note {
    type: string
    sql: ${TABLE}.activity_note ;;
  }

  dimension: activity_summary {
    type: string
    sql: ${TABLE}.activity_summary ;;
  }

  dimension: activity_type_id {
    type: number
    sql: ${TABLE}.activity_type_id ;;
  }

  dimension: activity_user_field_name {
    type: string
    sql: ${TABLE}.activity_user_field_name ;;
  }

  dimension: activity_user_id {
    type: number
    sql: ${TABLE}.activity_user_id ;;
  }

  dimension: activity_user_type {
    type: string
    sql: ${TABLE}.activity_user_type ;;
  }

  dimension: binding_model_id {
    type: number
    sql: ${TABLE}.binding_model_id ;;
  }

  dimension: binding_type {
    type: string
    sql: ${TABLE}.binding_type ;;
  }

  dimension: binding_view_types {
    type: string
    sql: ${TABLE}.binding_view_types ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
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

  dimension: crud_model_id {
    type: number
    sql: ${TABLE}.crud_model_id ;;
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

  dimension: help {
    type: string
    sql: ${TABLE}.help ;;
  }

  dimension: link_field_id {
    type: number
    sql: ${TABLE}.link_field_id ;;
  }

  dimension: mail_post_autofollow {
    type: yesno
    sql: ${TABLE}.mail_post_autofollow ;;
  }

  dimension: mail_post_method {
    type: string
    sql: ${TABLE}.mail_post_method ;;
  }

  dimension: model_id {
    type: number
    sql: ${TABLE}.model_id ;;
  }

  dimension: model_name {
    type: string
    sql: ${TABLE}.model_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: sms_method {
    type: string
    sql: ${TABLE}.sms_method ;;
  }

  dimension: sms_template_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.sms_template_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: template_id {
    type: number
    sql: ${TABLE}.template_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: usage {
    type: string
    sql: ${TABLE}.usage ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      model_name,
      name,
      activity_user_field_name,
      sms_template.name,
      sms_template.id
    ]
  }
}
