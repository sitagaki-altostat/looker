# The name of this view in Looker is "Stock Location"
view: stock_location {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.stock_location`
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

  dimension: barcode {
    type: string
    sql: ${TABLE}.barcode ;;
  }

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}.company_id ;;
  }

  dimension: complete_name {
    type: string
    sql: ${TABLE}.complete_name ;;
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

  dimension: cyclic_inventory_frequency {
    type: number
    sql: ${TABLE}.cyclic_inventory_frequency ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cyclic_inventory_frequency {
    type: sum
    sql: ${cyclic_inventory_frequency} ;;
  }

  measure: average_cyclic_inventory_frequency {
    type: average
    sql: ${cyclic_inventory_frequency} ;;
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

  dimension_group: last_inventory {
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
    sql: ${TABLE}.last_inventory_date ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension_group: next_inventory {
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
    sql: ${TABLE}.next_inventory_date ;;
  }

  dimension: parent_path {
    type: string
    sql: ${TABLE}.parent_path ;;
  }

  dimension: posx {
    type: number
    sql: ${TABLE}.posx ;;
  }

  dimension: posy {
    type: number
    sql: ${TABLE}.posy ;;
  }

  dimension: posz {
    type: number
    sql: ${TABLE}.posz ;;
  }

  dimension: removal_strategy_id {
    type: number
    sql: ${TABLE}.removal_strategy_id ;;
  }

  dimension: replenish_location {
    type: yesno
    sql: ${TABLE}.replenish_location ;;
  }

  dimension: return_location {
    type: yesno
    sql: ${TABLE}.return_location ;;
  }

  dimension: scrap_location {
    type: yesno
    sql: ${TABLE}.scrap_location ;;
  }

  dimension: storage_category_id {
    type: number
    sql: ${TABLE}.storage_category_id ;;
  }

  dimension: usage {
    type: string
    sql: ${TABLE}.usage ;;
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
    drill_fields: [id, complete_name, name]
  }
}
