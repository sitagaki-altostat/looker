# The name of this view in Looker is "Gamification Goal Definition"
view: gamification_goal_definition {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.gamification_goal_definition`
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
  # This dimension will be called "Action ID" in Explore.

  dimension: action_id {
    type: number
    sql: ${TABLE}.action_id ;;
  }

  dimension: batch_distinctive_field {
    type: number
    sql: ${TABLE}.batch_distinctive_field ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_batch_distinctive_field {
    type: sum
    sql: ${batch_distinctive_field} ;;
  }

  measure: average_batch_distinctive_field {
    type: average
    sql: ${batch_distinctive_field} ;;
  }

  dimension: batch_mode {
    type: yesno
    sql: ${TABLE}.batch_mode ;;
  }

  dimension: batch_user_expression {
    type: string
    sql: ${TABLE}.batch_user_expression ;;
  }

  dimension: computation_mode {
    type: string
    sql: ${TABLE}.computation_mode ;;
  }

  dimension: compute_code {
    type: string
    sql: ${TABLE}.compute_code ;;
  }

  dimension: condition {
    type: string
    sql: ${TABLE}.condition ;;
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

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: display_mode {
    type: string
    sql: ${TABLE}.display_mode ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: field_date_id {
    type: number
    sql: ${TABLE}.field_date_id ;;
  }

  dimension: field_id {
    type: number
    sql: ${TABLE}.field_id ;;
  }

  dimension: model_id {
    type: number
    sql: ${TABLE}.model_id ;;
  }

  dimension: monetary {
    type: yesno
    sql: ${TABLE}.monetary ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: res_id_field {
    type: string
    sql: ${TABLE}.res_id_field ;;
  }

  dimension: suffix {
    type: string
    sql: ${TABLE}.suffix ;;
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
