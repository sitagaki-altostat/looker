# The name of this view in Looker is "Stock Warehouse"
view: stock_warehouse {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.stock_warehouse`
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

  dimension: code {
    type: string
    sql: ${TABLE}.code ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}.company_id ;;
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

  dimension: crossdock_route_id {
    type: number
    sql: ${TABLE}.crossdock_route_id ;;
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

  dimension: delivery_route_id {
    type: number
    sql: ${TABLE}.delivery_route_id ;;
  }

  dimension: delivery_steps {
    type: string
    sql: ${TABLE}.delivery_steps ;;
  }

  dimension: in_type_id {
    type: number
    sql: ${TABLE}.in_type_id ;;
  }

  dimension: int_type_id {
    type: number
    sql: ${TABLE}.int_type_id ;;
  }

  dimension: lot_stock_id {
    type: number
    sql: ${TABLE}.lot_stock_id ;;
  }

  dimension: mto_pull_id {
    type: number
    sql: ${TABLE}.mto_pull_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: out_type_id {
    type: number
    sql: ${TABLE}.out_type_id ;;
  }

  dimension: pack_type_id {
    type: number
    sql: ${TABLE}.pack_type_id ;;
  }

  dimension: partner_id {
    type: number
    sql: ${TABLE}.partner_id ;;
  }

  dimension: pick_type_id {
    type: number
    sql: ${TABLE}.pick_type_id ;;
  }

  dimension: reception_route_id {
    type: number
    sql: ${TABLE}.reception_route_id ;;
  }

  dimension: reception_steps {
    type: string
    sql: ${TABLE}.reception_steps ;;
  }

  dimension: return_type_id {
    type: number
    sql: ${TABLE}.return_type_id ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: view_location_id {
    type: number
    sql: ${TABLE}.view_location_id ;;
  }

  dimension: wh_input_stock_loc_id {
    type: number
    sql: ${TABLE}.wh_input_stock_loc_id ;;
  }

  dimension: wh_output_stock_loc_id {
    type: number
    sql: ${TABLE}.wh_output_stock_loc_id ;;
  }

  dimension: wh_pack_stock_loc_id {
    type: number
    sql: ${TABLE}.wh_pack_stock_loc_id ;;
  }

  dimension: wh_qc_stock_loc_id {
    type: number
    sql: ${TABLE}.wh_qc_stock_loc_id ;;
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
