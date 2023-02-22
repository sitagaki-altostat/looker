# The name of this view in Looker is "Mail Notification"
view: mail_notification {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.mail_notification`
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
  # This dimension will be called "Author ID" in Explore.

  dimension: author_id {
    type: number
    sql: ${TABLE}.author_id ;;
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

  dimension: failure_reason {
    type: string
    sql: ${TABLE}.failure_reason ;;
  }

  dimension: failure_type {
    type: string
    sql: ${TABLE}.failure_type ;;
  }

  dimension: is_read {
    type: yesno
    sql: ${TABLE}.is_read ;;
  }

  dimension: letter_id {
    type: number
    sql: ${TABLE}.letter_id ;;
  }

  dimension: mail_mail_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.mail_mail_id ;;
  }

  dimension: mail_message_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.mail_message_id ;;
  }

  dimension: notification_status {
    type: string
    sql: ${TABLE}.notification_status ;;
  }

  dimension: notification_type {
    type: string
    sql: ${TABLE}.notification_type ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: read {
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
    sql: ${TABLE}.read_date ;;
  }

  dimension: res_partner_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.res_partner_id ;;
  }

  dimension: sms_id {
    type: number
    sql: ${TABLE}.sms_id ;;
  }

  dimension: sms_number {
    type: string
    sql: ${TABLE}.sms_number ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      mail_message.id,
      mail_message.record_name,
      res_partner.commercial_company_name,
      res_partner.id,
      res_partner.display_name,
      res_partner.company_name,
      res_partner.name,
      mail_mail.id
    ]
  }
}
