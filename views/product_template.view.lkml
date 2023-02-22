# The name of this view in Looker is "Product Template"
view: product_template {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.product_template`
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

  dimension: can_image_1024_be_zoomed {
    type: yesno
    sql: ${TABLE}.can_image_1024_be_zoomed ;;
  }

  dimension: categ_id {
    type: number
    sql: ${TABLE}.categ_id ;;
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

  dimension: default_code {
    type: string
    sql: ${TABLE}.default_code ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: description_picking {
    type: string
    sql: ${TABLE}.description_picking ;;
  }

  dimension: description_pickingin {
    type: string
    sql: ${TABLE}.description_pickingin ;;
  }

  dimension: description_pickingout {
    type: string
    sql: ${TABLE}.description_pickingout ;;
  }

  dimension: description_purchase {
    type: string
    sql: ${TABLE}.description_purchase ;;
  }

  dimension: description_sale {
    type: string
    sql: ${TABLE}.description_sale ;;
  }

  dimension: detailed_type {
    type: string
    sql: ${TABLE}.detailed_type ;;
  }

  dimension: has_configurable_attributes {
    type: yesno
    sql: ${TABLE}.has_configurable_attributes ;;
  }

  dimension: list_price {
    type: number
    sql: ${TABLE}.list_price ;;
  }

  dimension: message_main_attachment_id {
    type: number
    sql: ${TABLE}.message_main_attachment_id ;;
  }

  dimension: name {
    type: string
    sql: IF(JSON_VALUE(${TABLE}.name, '$.ja_JP') is not null,JSON_VALUE(${TABLE}.name, '$.ja_JP'),JSON_VALUE(${TABLE}.name, '$.en_US')) ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: purchase_ok {
    type: yesno
    sql: ${TABLE}.purchase_ok ;;
  }

  dimension: sale_delay {
    type: number
    sql: ${TABLE}.sale_delay ;;
  }

  dimension: sale_ok {
    type: yesno
    sql: ${TABLE}.sale_ok ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: tracking {
    type: string
    sql: ${TABLE}.tracking ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: uom_id {
    type: number
    sql: ${TABLE}.uom_id ;;
  }

  dimension: uom_po_id {
    type: number
    sql: ${TABLE}.uom_po_id ;;
  }

  dimension: volume {
    type: string
    sql: ${TABLE}.volume ;;
  }

  dimension: weight {
    type: string
    sql: ${TABLE}.weight ;;
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
    drill_fields: [id, name, product_attribute_product_template_rel.count]
  }
}
