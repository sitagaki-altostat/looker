# The name of this view in Looker is "Survey Question"
view: survey_question {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.survey_question`
    ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: answer {
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
    sql: ${TABLE}.answer_date ;;
  }

  dimension_group: answer_datetime {
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
    sql: ${TABLE}.answer_datetime ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Answer Numerical Box" in Explore.

  dimension: answer_numerical_box {
    type: number
    sql: ${TABLE}.answer_numerical_box ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_answer_numerical_box {
    type: sum
    sql: ${answer_numerical_box} ;;
  }

  measure: average_answer_numerical_box {
    type: average
    sql: ${answer_numerical_box} ;;
  }

  dimension: answer_score {
    type: number
    sql: ${TABLE}.answer_score ;;
  }

  dimension: comment_count_as_answer {
    type: yesno
    sql: ${TABLE}.comment_count_as_answer ;;
  }

  dimension: comments_allowed {
    type: yesno
    sql: ${TABLE}.comments_allowed ;;
  }

  dimension: comments_message {
    type: string
    sql: ${TABLE}.comments_message ;;
  }

  dimension: constr_error_msg {
    type: string
    sql: ${TABLE}.constr_error_msg ;;
  }

  dimension: constr_mandatory {
    type: yesno
    sql: ${TABLE}.constr_mandatory ;;
  }

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

  dimension: is_conditional {
    type: yesno
    sql: ${TABLE}.is_conditional ;;
  }

  dimension: is_page {
    type: yesno
    sql: ${TABLE}.is_page ;;
  }

  dimension: is_scored_question {
    type: yesno
    sql: ${TABLE}.is_scored_question ;;
  }

  dimension: is_time_limited {
    type: yesno
    sql: ${TABLE}.is_time_limited ;;
  }

  dimension: matrix_subtype {
    type: string
    sql: ${TABLE}.matrix_subtype ;;
  }

  dimension: page_id {
    type: number
    sql: ${TABLE}.page_id ;;
  }

  dimension: question_placeholder {
    type: string
    sql: ${TABLE}.question_placeholder ;;
  }

  dimension: question_type {
    type: string
    sql: ${TABLE}.question_type ;;
  }

  dimension: random_questions_count {
    type: number
    sql: ${TABLE}.random_questions_count ;;
  }

  dimension: save_as_email {
    type: yesno
    sql: ${TABLE}.save_as_email ;;
  }

  dimension: save_as_nickname {
    type: yesno
    sql: ${TABLE}.save_as_nickname ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: survey_id {
    type: number
    sql: ${TABLE}.survey_id ;;
  }

  dimension: time_limit {
    type: number
    sql: ${TABLE}.time_limit ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: triggering_answer_id {
    type: number
    sql: ${TABLE}.triggering_answer_id ;;
  }

  dimension: triggering_question_id {
    type: number
    sql: ${TABLE}.triggering_question_id ;;
  }

  dimension: validation_email {
    type: yesno
    sql: ${TABLE}.validation_email ;;
  }

  dimension: validation_error_msg {
    type: string
    sql: ${TABLE}.validation_error_msg ;;
  }

  dimension: validation_length_max {
    type: number
    sql: ${TABLE}.validation_length_max ;;
  }

  dimension: validation_length_min {
    type: number
    sql: ${TABLE}.validation_length_min ;;
  }

  dimension_group: validation_max {
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
    sql: ${TABLE}.validation_max_date ;;
  }

  dimension_group: validation_max_datetime {
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
    sql: ${TABLE}.validation_max_datetime ;;
  }

  dimension: validation_max_float_value {
    type: number
    sql: ${TABLE}.validation_max_float_value ;;
  }

  dimension_group: validation_min {
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
    sql: ${TABLE}.validation_min_date ;;
  }

  dimension_group: validation_min_datetime {
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
    sql: ${TABLE}.validation_min_datetime ;;
  }

  dimension: validation_min_float_value {
    type: number
    sql: ${TABLE}.validation_min_float_value ;;
  }

  dimension: validation_required {
    type: yesno
    sql: ${TABLE}.validation_required ;;
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
    drill_fields: [id, save_as_nickname, survey_question_survey_user_input_rel.count]
  }
}
