# The name of this view in Looker is "Rating Rating"
view: rating_rating {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.rating_rating`
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
  # This dimension will be called "Access Token" in Explore.

  dimension: access_token {
    type: string
    sql: ${TABLE}.access_token ;;
  }

  dimension: consumed {
    type: yesno
    sql: ${TABLE}.consumed ;;
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

  dimension: feedback {
    type: string
    sql: ${TABLE}.feedback ;;
  }

  dimension: is_internal {
    type: yesno
    sql: ${TABLE}.is_internal ;;
  }

  dimension: message_id {
    type: number
    sql: ${TABLE}.message_id ;;
  }

  dimension: parent_res_id {
    type: number
    sql: ${TABLE}.parent_res_id ;;
  }

  dimension: parent_res_model {
    type: string
    sql: ${TABLE}.parent_res_model ;;
  }

  dimension: parent_res_model_id {
    type: number
    sql: ${TABLE}.parent_res_model_id ;;
  }

  dimension: parent_res_name {
    type: string
    sql: ${TABLE}.parent_res_name ;;
  }

  dimension: partner_id {
    type: number
    sql: ${TABLE}.partner_id ;;
  }

  dimension: publisher_comment {
    type: string
    sql: ${TABLE}.publisher_comment ;;
  }

  dimension_group: publisher_datetime {
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
    sql: ${TABLE}.publisher_datetime ;;
  }

  dimension: publisher_id {
    type: number
    sql: ${TABLE}.publisher_id ;;
  }

  dimension: rated_partner_id {
    type: number
    sql: ${TABLE}.rated_partner_id ;;
  }

  dimension: rating {
    type: number
    sql: ${TABLE}.rating ;;
  }

  dimension: rating_text {
    type: string
    sql: ${TABLE}.rating_text ;;
  }

  dimension: res_id {
    type: number
    sql: ${TABLE}.res_id ;;
  }

  dimension: res_model {
    type: string
    sql: ${TABLE}.res_model ;;
  }

  dimension: res_model_id {
    type: number
    sql: ${TABLE}.res_model_id ;;
  }

  dimension: res_name {
    type: string
    sql: ${TABLE}.res_name ;;
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
    drill_fields: [id, res_name, parent_res_name]
  }
}
