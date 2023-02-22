# The name of this view in Looker is "Report Paperformat"
view: report_paperformat {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.report_paperformat`
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

  dimension: default {
    type: yesno
    sql: ${TABLE}.`default` ;;
  }

  dimension: disable_shrinking {
    type: yesno
    sql: ${TABLE}.disable_shrinking ;;
  }

  dimension: dpi {
    type: number
    sql: ${TABLE}.dpi ;;
  }

  dimension: format {
    type: string
    sql: ${TABLE}.format ;;
  }

  dimension: header_line {
    type: yesno
    sql: ${TABLE}.header_line ;;
  }

  dimension: header_spacing {
    type: number
    sql: ${TABLE}.header_spacing ;;
  }

  dimension: margin_bottom {
    type: number
    sql: ${TABLE}.margin_bottom ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_margin_bottom {
    type: sum
    sql: ${margin_bottom} ;;
  }

  measure: average_margin_bottom {
    type: average
    sql: ${margin_bottom} ;;
  }

  dimension: margin_left {
    type: number
    sql: ${TABLE}.margin_left ;;
  }

  dimension: margin_right {
    type: number
    sql: ${TABLE}.margin_right ;;
  }

  dimension: margin_top {
    type: number
    sql: ${TABLE}.margin_top ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: orientation {
    type: string
    sql: ${TABLE}.orientation ;;
  }

  dimension: page_height {
    type: number
    sql: ${TABLE}.page_height ;;
  }

  dimension: page_width {
    type: number
    sql: ${TABLE}.page_width ;;
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
