# The name of this view in Looker is "Project Project"
view: project_project {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.project_project`
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

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: alias_id {
    type: number
    sql: ${TABLE}.alias_id ;;
  }

  dimension: allow_milestones {
    type: yesno
    sql: ${TABLE}.allow_milestones ;;
  }

  dimension: allow_recurring_tasks {
    type: yesno
    sql: ${TABLE}.allow_recurring_tasks ;;
  }

  dimension: allow_subtasks {
    type: yesno
    sql: ${TABLE}.allow_subtasks ;;
  }

  dimension: allow_task_dependencies {
    type: yesno
    sql: ${TABLE}.allow_task_dependencies ;;
  }

  dimension: analytic_account_id {
    type: number
    sql: ${TABLE}.analytic_account_id ;;
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

  dimension_group: date {
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
    sql: ${TABLE}.date ;;
  }

  dimension_group: date_start {
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
    sql: ${TABLE}.date_start ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: label_tasks {
    type: string
    sql: ${TABLE}.label_tasks ;;
  }

  dimension: last_update_id {
    type: number
    sql: ${TABLE}.last_update_id ;;
  }

  dimension: last_update_status {
    type: string
    sql: ${TABLE}.last_update_status ;;
  }

  dimension: message_main_attachment_id {
    type: number
    sql: ${TABLE}.message_main_attachment_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: partner_email {
    type: string
    sql: ${TABLE}.partner_email ;;
  }

  dimension: partner_id {
    type: number
    sql: ${TABLE}.partner_id ;;
  }

  dimension: partner_phone {
    type: string
    sql: ${TABLE}.partner_phone ;;
  }

  dimension: privacy_visibility {
    type: string
    sql: ${TABLE}.privacy_visibility ;;
  }

  dimension: rating_active {
    type: yesno
    sql: ${TABLE}.rating_active ;;
  }

  dimension_group: rating_request_deadline {
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
    sql: ${TABLE}.rating_request_deadline ;;
  }

  dimension: rating_status {
    type: string
    sql: ${TABLE}.rating_status ;;
  }

  dimension: rating_status_period {
    type: string
    sql: ${TABLE}.rating_status_period ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: stage_id {
    type: number
    sql: ${TABLE}.stage_id ;;
  }

  dimension: task_properties_definition {
    type: string
    sql: ${TABLE}.task_properties_definition ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
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
    drill_fields: [id, name, project_project_project_tags_rel.count]
  }
}
