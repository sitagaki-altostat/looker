# The name of this view in Looker is "Resource Calendar Attendance"
view: resource_calendar_attendance {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.resource_calendar_attendance`
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
  # This dimension will be called "Calendar ID" in Explore.

  dimension: calendar_id {
    type: number
    sql: ${TABLE}.calendar_id ;;
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

  dimension_group: date_from {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_from ;;
  }

  dimension_group: date_to {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date_to ;;
  }

  dimension: day_period {
    type: string
    sql: ${TABLE}.day_period ;;
  }

  dimension: dayofweek {
    type: string
    sql: ${TABLE}.dayofweek ;;
  }

  dimension: display_type {
    type: string
    sql: ${TABLE}.display_type ;;
  }

  dimension: hour_from {
    type: number
    sql: ${TABLE}.hour_from ;;
  }

  dimension: hour_to {
    type: number
    sql: ${TABLE}.hour_to ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: resource_id {
    type: number
    sql: ${TABLE}.resource_id ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: week_type {
    type: string
    sql: ${TABLE}.week_type ;;
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
    drill_fields: [id, name]
  }
}
