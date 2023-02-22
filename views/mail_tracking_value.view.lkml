# The name of this view in Looker is "Mail Tracking Value"
view: mail_tracking_value {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.mail_tracking_value`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Create Uid" in Explore.

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

  dimension: field {
    type: number
    sql: ${TABLE}.field ;;
  }

  dimension: field_desc {
    type: string
    sql: ${TABLE}.field_desc ;;
  }

  dimension: field_type {
    type: string
    sql: ${TABLE}.field_type ;;
  }

  dimension: mail_message_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.mail_message_id ;;
  }

  dimension: new_value_char {
    type: string
    sql: ${TABLE}.new_value_char ;;
  }

  dimension_group: new_value_datetime {
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
    sql: ${TABLE}.new_value_datetime ;;
  }

  dimension: new_value_float {
    type: number
    sql: ${TABLE}.new_value_float ;;
  }

  dimension: new_value_integer {
    type: number
    sql: ${TABLE}.new_value_integer ;;
  }

  dimension: new_value_monetary {
    type: number
    sql: ${TABLE}.new_value_monetary ;;
  }

  dimension: new_value_text {
    type: string
    sql: ${TABLE}.new_value_text ;;
  }

  dimension: old_value_char {
    type: string
    sql: ${TABLE}.old_value_char ;;
  }

  dimension_group: old_value_datetime {
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
    sql: ${TABLE}.old_value_datetime ;;
  }

  dimension: old_value_float {
    type: number
    sql: ${TABLE}.old_value_float ;;
  }

  dimension: old_value_integer {
    type: number
    sql: ${TABLE}.old_value_integer ;;
  }

  dimension: old_value_monetary {
    type: number
    sql: ${TABLE}.old_value_monetary ;;
  }

  dimension: old_value_text {
    type: string
    sql: ${TABLE}.old_value_text ;;
  }

  dimension: tracking_sequence {
    type: number
    sql: ${TABLE}.tracking_sequence ;;
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
    drill_fields: [id, mail_message.id, mail_message.record_name]
  }
}
