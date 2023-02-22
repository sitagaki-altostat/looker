# The name of this view in Looker is "Product Template Attribute Value"
view: product_template_attribute_value {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.product_template_attribute_value`
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
  # This dimension will be called "Attribute ID" in Explore.

  dimension: attribute_id {
    type: number
    sql: ${TABLE}.attribute_id ;;
  }

  dimension: attribute_line_id {
    type: number
    sql: ${TABLE}.attribute_line_id ;;
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

  dimension: price_extra {
    type: string
    sql: ${TABLE}.price_extra ;;
  }

  dimension: product_attribute_value_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.product_attribute_value_id ;;
  }

  dimension: product_tmpl_id {
    type: number
    sql: ${TABLE}.product_tmpl_id ;;
  }

  dimension: ptav_active {
    type: yesno
    sql: ${TABLE}.ptav_active ;;
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
    drill_fields: [id, product_attribute_value.name, product_attribute_value.id, product_variant_combination.count]
  }
}
