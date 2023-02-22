# The name of this view in Looker is "Stock Move"
view: stock_move {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.stock_move`
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
  # This dimension will be called "Additional" in Explore.

  dimension: additional {
    type: yesno
    sql: ${TABLE}.additional ;;
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

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension_group: date_deadline {
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
    sql: ${TABLE}.date_deadline ;;
  }

  dimension_group: delay_alert {
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
    sql: ${TABLE}.delay_alert_date ;;
  }

  dimension: description_picking {
    type: string
    sql: ${TABLE}.description_picking ;;
  }

  dimension: group_id {
    type: number
    sql: ${TABLE}.group_id ;;
  }

  dimension: is_inventory {
    type: yesno
    sql: ${TABLE}.is_inventory ;;
  }

  dimension: location_dest_id {
    type: number
    sql: ${TABLE}.location_dest_id ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: next_serial {
    type: string
    sql: ${TABLE}.next_serial ;;
  }

  dimension: next_serial_count {
    type: number
    sql: ${TABLE}.next_serial_count ;;
  }

  dimension: orderpoint_id {
    type: number
    sql: ${TABLE}.orderpoint_id ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }

  dimension: origin_returned_move_id {
    type: number
    sql: ${TABLE}.origin_returned_move_id ;;
  }

  dimension: package_level_id {
    type: number
    sql: ${TABLE}.package_level_id ;;
  }

  dimension: partner_id {
    type: number
    sql: ${TABLE}.partner_id ;;
  }

  dimension: picking_id {
    type: number
    sql: ${TABLE}.picking_id ;;
  }

  dimension: picking_type_id {
    type: number
    sql: ${TABLE}.picking_type_id ;;
  }

  dimension: price_unit {
    type: number
    sql: ${TABLE}.price_unit ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_price_unit {
    type: sum
    sql: ${price_unit} ;;
  }

  measure: average_price_unit {
    type: average
    sql: ${price_unit} ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: procure_method {
    type: string
    sql: ${TABLE}.procure_method ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: product_packaging_id {
    type: number
    sql: ${TABLE}.product_packaging_id ;;
  }

  dimension: product_qty {
    type: string
    sql: ${TABLE}.product_qty ;;
  }

  dimension: product_uom {
    type: number
    sql: ${TABLE}.product_uom ;;
  }

  dimension: product_uom_qty {
    type: string
    sql: ${TABLE}.product_uom_qty ;;
  }

  dimension: propagate_cancel {
    type: yesno
    sql: ${TABLE}.propagate_cancel ;;
  }

  dimension: quantity_done {
    type: string
    sql: ${TABLE}.quantity_done ;;
  }

  dimension: reference {
    type: string
    sql: ${TABLE}.reference ;;
  }

  dimension_group: reservation {
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
    sql: ${TABLE}.reservation_date ;;
  }

  dimension: restrict_partner_id {
    type: number
    sql: ${TABLE}.restrict_partner_id ;;
  }

  dimension: rule_id {
    type: number
    sql: ${TABLE}.rule_id ;;
  }

  dimension: scrapped {
    type: yesno
    sql: ${TABLE}.scrapped ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
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
