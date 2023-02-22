# The name of this view in Looker is "Mail Mail"
view: mail_mail {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.mail_mail`
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
  # This dimension will be called "Auto Delete" in Explore.

  dimension: auto_delete {
    type: yesno
    sql: ${TABLE}.auto_delete ;;
  }

  dimension: body_html {
    type: string
    sql: ${TABLE}.body_html ;;
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

  dimension: datastream_metadata__source_timestamp {
    type: number
    sql: ${TABLE}.datastream_metadata.source_timestamp ;;
    group_label: "Datastream Metadata"
    group_item_label: "Source Timestamp"
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_datastream_metadata__source_timestamp {
    type: sum
    sql: ${datastream_metadata__source_timestamp} ;;
  }

  measure: average_datastream_metadata__source_timestamp {
    type: average
    sql: ${datastream_metadata__source_timestamp} ;;
  }

  dimension: datastream_metadata__uuid {
    type: string
    sql: ${TABLE}.datastream_metadata.uuid ;;
    group_label: "Datastream Metadata"
    group_item_label: "Uuid"
  }

  dimension: email_cc {
    type: string
    sql: ${TABLE}.email_cc ;;
  }

  dimension: email_to {
    type: string
    sql: ${TABLE}.email_to ;;
  }

  dimension: failure_reason {
    type: string
    sql: ${TABLE}.failure_reason ;;
  }

  dimension: failure_type {
    type: string
    sql: ${TABLE}.failure_type ;;
  }

  dimension: fetchmail_server_id {
    type: number
    sql: ${TABLE}.fetchmail_server_id ;;
  }

  dimension: headers {
    type: string
    sql: ${TABLE}.headers ;;
  }

  dimension: is_notification {
    type: yesno
    sql: ${TABLE}.is_notification ;;
  }

  dimension: mail_message_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.mail_message_id ;;
  }

  dimension: mailing_id {
    type: number
    sql: ${TABLE}.mailing_id ;;
  }

  dimension: references {
    type: string
    sql: ${TABLE}.references ;;
  }

  dimension_group: scheduled {
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
    sql: ${TABLE}.scheduled_date ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: to_delete {
    type: yesno
    sql: ${TABLE}.to_delete ;;
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
    drill_fields: [id, mail_message.id, mail_message.record_name, mail_notification.count, mailing_trace.count]
  }
}
