# The name of this view in Looker is "Mailing Mailing"
view: mailing_mailing {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.mailing_mailing`
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
  # This dimension will be called "Ab Testing Completed" in Explore.

  dimension: ab_testing_completed {
    type: yesno
    sql: ${TABLE}.ab_testing_completed ;;
  }

  dimension: ab_testing_enabled {
    type: yesno
    sql: ${TABLE}.ab_testing_enabled ;;
  }

  dimension: ab_testing_pc {
    type: number
    sql: ${TABLE}.ab_testing_pc ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ab_testing_pc {
    type: sum
    sql: ${ab_testing_pc} ;;
  }

  measure: average_ab_testing_pc {
    type: average
    sql: ${ab_testing_pc} ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: body_arch {
    type: string
    sql: ${TABLE}.body_arch ;;
  }

  dimension: body_html {
    type: string
    sql: ${TABLE}.body_html ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: calendar {
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
    sql: ${TABLE}.calendar_date ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: color {
    type: number
    sql: ${TABLE}.color ;;
  }

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

  dimension: email_from {
    type: string
    sql: ${TABLE}.email_from ;;
  }

  dimension: favorite {
    type: yesno
    sql: ${TABLE}.favorite ;;
  }

  dimension_group: favorite {
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
    sql: ${TABLE}.favorite_date ;;
  }

  dimension: keep_archives {
    type: yesno
    sql: ${TABLE}.keep_archives ;;
  }

  dimension: kpi_mail_required {
    type: yesno
    sql: ${TABLE}.kpi_mail_required ;;
  }

  dimension: lang {
    type: string
    sql: ${TABLE}.lang ;;
  }

  dimension: mail_server_id {
    type: number
    sql: ${TABLE}.mail_server_id ;;
  }

  dimension: mailing_domain {
    type: string
    sql: ${TABLE}.mailing_domain ;;
  }

  dimension: mailing_filter_id {
    type: number
    sql: ${TABLE}.mailing_filter_id ;;
  }

  dimension: mailing_model_id {
    type: number
    sql: ${TABLE}.mailing_model_id ;;
  }

  dimension: mailing_type {
    type: string
    sql: ${TABLE}.mailing_type ;;
  }

  dimension: medium_id {
    type: number
    sql: ${TABLE}.medium_id ;;
  }

  dimension: message_main_attachment_id {
    type: number
    sql: ${TABLE}.message_main_attachment_id ;;
  }

  dimension: preview {
    type: string
    sql: ${TABLE}.preview ;;
  }

  dimension: reply_to {
    type: string
    sql: ${TABLE}.reply_to ;;
  }

  dimension: reply_to_mode {
    type: string
    sql: ${TABLE}.reply_to_mode ;;
  }

  dimension_group: schedule {
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
    sql: ${TABLE}.schedule_date ;;
  }

  dimension: schedule_type {
    type: string
    sql: ${TABLE}.schedule_type ;;
  }

  dimension_group: sent {
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
    sql: ${TABLE}.sent_date ;;
  }

  dimension: source_id {
    type: number
    sql: ${TABLE}.source_id ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
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
    drill_fields: [id]
  }
}
