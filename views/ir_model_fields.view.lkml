# The name of this view in Looker is "Ir Model Fields"
view: ir_model_fields {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.ir_model_fields`
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
  # This dimension will be called "Column1" in Explore.

  dimension: column1 {
    type: string
    sql: ${TABLE}.column1 ;;
  }

  dimension: column2 {
    type: string
    sql: ${TABLE}.column2 ;;
  }

  dimension: complete_name {
    type: string
    sql: ${TABLE}.complete_name ;;
  }

  dimension: compute {
    type: string
    sql: ${TABLE}.compute ;;
  }

  dimension: copied {
    type: yesno
    sql: ${TABLE}.copied ;;
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

  dimension: depends {
    type: string
    sql: ${TABLE}.depends ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: field_description {
    type: string
    sql: ${TABLE}.field_description ;;
  }

  dimension: group_expand {
    type: yesno
    sql: ${TABLE}.group_expand ;;
  }

  dimension: help {
    type: string
    sql: ${TABLE}.help ;;
  }

  dimension: index {
    type: yesno
    sql: ${TABLE}.index ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: model_id {
    type: number
    sql: ${TABLE}.model_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: on_delete {
    type: string
    sql: ${TABLE}.on_delete ;;
  }

  dimension: readonly {
    type: yesno
    sql: ${TABLE}.readonly ;;
  }

  dimension: related {
    type: string
    sql: ${TABLE}.related ;;
  }

  dimension: related_field_id {
    type: number
    sql: ${TABLE}.related_field_id ;;
  }

  dimension: relation {
    type: string
    sql: ${TABLE}.relation ;;
  }

  dimension: relation_field {
    type: string
    sql: ${TABLE}.relation_field ;;
  }

  dimension: relation_field_id {
    type: number
    sql: ${TABLE}.relation_field_id ;;
  }

  dimension: relation_table {
    type: string
    sql: ${TABLE}.relation_table ;;
  }

  dimension: required {
    type: yesno
    sql: ${TABLE}.required ;;
  }

  dimension: selectable {
    type: yesno
    sql: ${TABLE}.selectable ;;
  }

  dimension: size {
    type: number
    sql: ${TABLE}.size ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: store {
    type: yesno
    sql: ${TABLE}.store ;;
  }

  dimension: tracking {
    type: number
    sql: ${TABLE}.tracking ;;
  }

  dimension: translate {
    type: yesno
    sql: ${TABLE}.translate ;;
  }

  dimension: ttype {
    type: string
    sql: ${TABLE}.ttype ;;
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
