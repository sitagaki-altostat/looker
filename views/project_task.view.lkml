# The name of this view in Looker is "Project Task"
view: project_task {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.project_task`
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

  dimension: analytic_account_id {
    type: number
    sql: ${TABLE}.analytic_account_id ;;
  }

  dimension: ancestor_id {
    type: number
    sql: ${TABLE}.ancestor_id ;;
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

  dimension_group: date_assign {
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
    sql: ${TABLE}.date_assign ;;
  }

  dimension_group: date_deadline {
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
    sql: ${TABLE}.date_deadline ;;
  }

  dimension_group: date_end {
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
    sql: ${TABLE}.date_end ;;
  }

  dimension_group: date_last_stage_update {
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
    sql: ${TABLE}.date_last_stage_update ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: display_project_id {
    type: number
    sql: ${TABLE}.display_project_id ;;
  }

  dimension: displayed_image_id {
    type: number
    sql: ${TABLE}.displayed_image_id ;;
  }

  dimension: email_cc {
    type: string
    sql: ${TABLE}.email_cc ;;
  }

  dimension: email_from {
    type: string
    sql: ${TABLE}.email_from ;;
  }

  dimension: is_analytic_account_id_changed {
    type: yesno
    sql: ${TABLE}.is_analytic_account_id_changed ;;
  }

  dimension: is_blocked {
    type: yesno
    sql: ${TABLE}.is_blocked ;;
  }

  dimension: is_closed {
    type: yesno
    sql: ${TABLE}.is_closed ;;
  }

  dimension: kanban_state {
    type: string
    sql: ${TABLE}.kanban_state ;;
  }

  dimension: message_main_attachment_id {
    type: number
    sql: ${TABLE}.message_main_attachment_id ;;
  }

  dimension: milestone_id {
    type: number
    sql: ${TABLE}.milestone_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
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

  dimension: planned_hours {
    type: number
    sql: ${TABLE}.planned_hours ;;
  }

  dimension: priority {
    type: string
    sql: ${TABLE}.priority ;;
  }

  dimension: project_id {
    type: number
    sql: ${TABLE}.project_id ;;
  }

  dimension: rating_last_value {
    type: number
    sql: ${TABLE}.rating_last_value ;;
  }

  dimension: recurrence_id {
    type: number
    sql: ${TABLE}.recurrence_id ;;
  }

  dimension: recurring_task {
    type: yesno
    sql: ${TABLE}.recurring_task ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: stage_id {
    type: number
    sql: ${TABLE}.stage_id ;;
  }

  dimension: task_properties {
    type: string
    sql: ${TABLE}.task_properties ;;
  }

  dimension: working_days_close {
    type: number
    sql: ${TABLE}.working_days_close ;;
  }

  dimension: working_days_open {
    type: number
    sql: ${TABLE}.working_days_open ;;
  }

  dimension: working_hours_close {
    type: string
    sql: ${TABLE}.working_hours_close ;;
  }

  dimension: working_hours_open {
    type: string
    sql: ${TABLE}.working_hours_open ;;
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
    drill_fields: [id, name, project_tags_project_task_rel.count]
  }
}
