# The name of this view in Looker is "Survey User Input Line"
view: survey_user_input_line {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.survey_user_input_line`
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
  # This dimension will be called "Answer Is Correct" in Explore.

  dimension: answer_is_correct {
    type: yesno
    sql: ${TABLE}.answer_is_correct ;;
  }

  dimension: answer_score {
    type: number
    sql: ${TABLE}.answer_score ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_answer_score {
    type: sum
    sql: ${answer_score} ;;
  }

  measure: average_answer_score {
    type: average
    sql: ${answer_score} ;;
  }

  dimension: answer_type {
    type: string
    sql: ${TABLE}.answer_type ;;
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

  dimension: matrix_row_id {
    type: number
    sql: ${TABLE}.matrix_row_id ;;
  }

  dimension: question_id {
    type: number
    sql: ${TABLE}.question_id ;;
  }

  dimension: question_sequence {
    type: number
    sql: ${TABLE}.question_sequence ;;
  }

  dimension: skipped {
    type: yesno
    sql: ${TABLE}.skipped ;;
  }

  dimension: suggested_answer_id {
    type: number
    sql: ${TABLE}.suggested_answer_id ;;
  }

  dimension: survey_id {
    type: number
    sql: ${TABLE}.survey_id ;;
  }

  dimension: user_input_id {
    type: number
    sql: ${TABLE}.user_input_id ;;
  }

  dimension: value_char_box {
    type: string
    sql: ${TABLE}.value_char_box ;;
  }

  dimension_group: value {
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
    sql: ${TABLE}.value_date ;;
  }

  dimension_group: value_datetime {
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
    sql: ${TABLE}.value_datetime ;;
  }

  dimension: value_numerical_box {
    type: number
    sql: ${TABLE}.value_numerical_box ;;
  }

  dimension: value_text_box {
    type: string
    sql: ${TABLE}.value_text_box ;;
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
    drill_fields: [id]
  }
}
