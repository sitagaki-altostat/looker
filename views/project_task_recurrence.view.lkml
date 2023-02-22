# The name of this view in Looker is "Project Task Recurrence"
view: project_task_recurrence {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.project_task_recurrence`
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

  dimension: fri {
    type: yesno
    sql: ${TABLE}.fri ;;
  }

  dimension: mon {
    type: yesno
    sql: ${TABLE}.mon ;;
  }

  dimension_group: next_recurrence {
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
    sql: ${TABLE}.next_recurrence_date ;;
  }

  dimension: recurrence_left {
    type: number
    sql: ${TABLE}.recurrence_left ;;
  }

  dimension: repeat_day {
    type: string
    sql: ${TABLE}.repeat_day ;;
  }

  dimension: repeat_interval {
    type: number
    sql: ${TABLE}.repeat_interval ;;
  }

  dimension: repeat_month {
    type: string
    sql: ${TABLE}.repeat_month ;;
  }

  dimension: repeat_number {
    type: number
    sql: ${TABLE}.repeat_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_repeat_number {
    type: sum
    sql: ${repeat_number} ;;
  }

  measure: average_repeat_number {
    type: average
    sql: ${repeat_number} ;;
  }

  dimension: repeat_on_month {
    type: string
    sql: ${TABLE}.repeat_on_month ;;
  }

  dimension: repeat_on_year {
    type: string
    sql: ${TABLE}.repeat_on_year ;;
  }

  dimension: repeat_type {
    type: string
    sql: ${TABLE}.repeat_type ;;
  }

  dimension: repeat_unit {
    type: string
    sql: ${TABLE}.repeat_unit ;;
  }

  dimension_group: repeat_until {
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
    sql: ${TABLE}.repeat_until ;;
  }

  dimension: repeat_week {
    type: string
    sql: ${TABLE}.repeat_week ;;
  }

  dimension: repeat_weekday {
    type: string
    sql: ${TABLE}.repeat_weekday ;;
  }

  dimension: sat {
    type: yesno
    sql: ${TABLE}.sat ;;
  }

  dimension: sun {
    type: yesno
    sql: ${TABLE}.sun ;;
  }

  dimension: thu {
    type: yesno
    sql: ${TABLE}.thu ;;
  }

  dimension: tue {
    type: yesno
    sql: ${TABLE}.tue ;;
  }

  dimension: wed {
    type: yesno
    sql: ${TABLE}.wed ;;
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
