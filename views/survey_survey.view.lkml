# The name of this view in Looker is "Survey Survey"
view: survey_survey {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.survey_survey`
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
  # This dimension will be called "Access Mode" in Explore.

  dimension: access_mode {
    type: string
    sql: ${TABLE}.access_mode ;;
  }

  dimension: access_token {
    type: string
    sql: ${TABLE}.access_token ;;
  }

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: attempts_limit {
    type: number
    sql: ${TABLE}.attempts_limit ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_attempts_limit {
    type: sum
    sql: ${attempts_limit} ;;
  }

  measure: average_attempts_limit {
    type: average
    sql: ${attempts_limit} ;;
  }

  dimension: certification {
    type: yesno
    sql: ${TABLE}.certification ;;
  }

  dimension: certification_badge_id {
    type: number
    sql: ${TABLE}.certification_badge_id ;;
  }

  dimension: certification_give_badge {
    type: yesno
    sql: ${TABLE}.certification_give_badge ;;
  }

  dimension: certification_mail_template_id {
    type: number
    sql: ${TABLE}.certification_mail_template_id ;;
  }

  dimension: certification_report_layout {
    type: string
    sql: ${TABLE}.certification_report_layout ;;
  }

  dimension: color {
    type: number
    sql: ${TABLE}.color ;;
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

  dimension: description_done {
    type: string
    sql: ${TABLE}.description_done ;;
  }

  dimension: is_attempts_limited {
    type: yesno
    sql: ${TABLE}.is_attempts_limited ;;
  }

  dimension: is_time_limited {
    type: yesno
    sql: ${TABLE}.is_time_limited ;;
  }

  dimension: message_main_attachment_id {
    type: number
    sql: ${TABLE}.message_main_attachment_id ;;
  }

  dimension: progression_mode {
    type: string
    sql: ${TABLE}.progression_mode ;;
  }

  dimension: questions_layout {
    type: string
    sql: ${TABLE}.questions_layout ;;
  }

  dimension: questions_selection {
    type: string
    sql: ${TABLE}.questions_selection ;;
  }

  dimension: scoring_success_min {
    type: number
    sql: ${TABLE}.scoring_success_min ;;
  }

  dimension: scoring_type {
    type: string
    sql: ${TABLE}.scoring_type ;;
  }

  dimension: session_code {
    type: string
    sql: ${TABLE}.session_code ;;
  }

  dimension: session_question_id {
    type: number
    sql: ${TABLE}.session_question_id ;;
  }

  dimension_group: session_question_start {
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
    sql: ${TABLE}.session_question_start_time ;;
  }

  dimension: session_speed_rating {
    type: yesno
    sql: ${TABLE}.session_speed_rating ;;
  }

  dimension_group: session_start {
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
    sql: ${TABLE}.session_start_time ;;
  }

  dimension: session_state {
    type: string
    sql: ${TABLE}.session_state ;;
  }

  dimension: time_limit {
    type: number
    sql: ${TABLE}.time_limit ;;
  }

  dimension: title {
    type: string
    sql: ${TABLE}.title ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: users_can_go_back {
    type: yesno
    sql: ${TABLE}.users_can_go_back ;;
  }

  dimension: users_login_required {
    type: yesno
    sql: ${TABLE}.users_login_required ;;
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
