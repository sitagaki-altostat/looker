# The name of this view in Looker is "Stock Picking Type"
view: stock_picking_type {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.stock_picking_type`
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

  dimension: auto_show_reception_report {
    type: yesno
    sql: ${TABLE}.auto_show_reception_report ;;
  }

  dimension: barcode {
    type: string
    sql: ${TABLE}.barcode ;;
  }

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: color {
    type: number
    sql: ${TABLE}.color ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_color {
    type: sum
    sql: ${color} ;;
  }

  measure: average_color {
    type: average
    sql: ${color} ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}.company_id ;;
  }

  dimension: create_backorder {
    type: string
    sql: ${TABLE}.create_backorder ;;
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

  dimension: datastream_metadata__uuid {
    type: string
    sql: ${TABLE}.datastream_metadata.uuid ;;
    group_label: "Datastream Metadata"
    group_item_label: "Uuid"
  }

  dimension: default_location_dest_id {
    type: number
    sql: ${TABLE}.default_location_dest_id ;;
  }

  dimension: default_location_src_id {
    type: number
    sql: ${TABLE}.default_location_src_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: print_label {
    type: yesno
    sql: ${TABLE}.print_label ;;
  }

  dimension: reservation_days_before {
    type: number
    sql: ${TABLE}.reservation_days_before ;;
  }

  dimension: reservation_days_before_priority {
    type: number
    sql: ${TABLE}.reservation_days_before_priority ;;
  }

  dimension: reservation_method {
    type: string
    sql: ${TABLE}.reservation_method ;;
  }

  dimension: return_picking_type_id {
    type: number
    sql: ${TABLE}.return_picking_type_id ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: sequence_code {
    type: string
    sql: ${TABLE}.sequence_code ;;
  }

  dimension: sequence_id {
    type: number
    sql: ${TABLE}.sequence_id ;;
  }

  dimension: show_entire_packs {
    type: yesno
    sql: ${TABLE}.show_entire_packs ;;
  }

  dimension: show_operations {
    type: yesno
    sql: ${TABLE}.show_operations ;;
  }

  dimension: show_reserved {
    type: yesno
    sql: ${TABLE}.show_reserved ;;
  }

  dimension: use_create_lots {
    type: yesno
    sql: ${TABLE}.use_create_lots ;;
  }

  dimension: use_existing_lots {
    type: yesno
    sql: ${TABLE}.use_existing_lots ;;
  }

  dimension: warehouse_id {
    type: number
    sql: ${TABLE}.warehouse_id ;;
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
