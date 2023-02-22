# The name of this view in Looker is "Mail Compose Message"
view: mail_compose_message {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.mail_compose_message`
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
  # This dimension will be called "Active Domain" in Explore.

  dimension: active_domain {
    type: string
    sql: ${TABLE}.active_domain ;;
  }

  dimension: author_id {
    type: number
    sql: ${TABLE}.author_id ;;
  }

  dimension: auto_delete {
    type: yesno
    sql: ${TABLE}.auto_delete ;;
  }

  dimension: auto_delete_message {
    type: yesno
    sql: ${TABLE}.auto_delete_message ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}.body ;;
  }

  dimension: campaign_id {
    type: number
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: composition_mode {
    type: string
    sql: ${TABLE}.composition_mode ;;
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

  dimension: email_add_signature {
    type: yesno
    sql: ${TABLE}.email_add_signature ;;
  }

  dimension: email_from {
    type: string
    sql: ${TABLE}.email_from ;;
  }

  dimension: email_layout_xmlid {
    type: string
    sql: ${TABLE}.email_layout_xmlid ;;
  }

  dimension: is_log {
    type: yesno
    sql: ${TABLE}.is_log ;;
  }

  dimension: lang {
    type: string
    sql: ${TABLE}.lang ;;
  }

  dimension: mail_activity_type_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.mail_activity_type_id ;;
  }

  dimension: mail_server_id {
    type: number
    sql: ${TABLE}.mail_server_id ;;
  }

  dimension: mass_mailing_id {
    type: number
    sql: ${TABLE}.mass_mailing_id ;;
  }

  dimension: mass_mailing_name {
    type: string
    sql: ${TABLE}.mass_mailing_name ;;
  }

  dimension: message_type {
    type: string
    sql: ${TABLE}.message_type ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: notify {
    type: yesno
    sql: ${TABLE}.notify ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: record_name {
    type: string
    sql: ${TABLE}.record_name ;;
  }

  dimension: reply_to {
    type: string
    sql: ${TABLE}.reply_to ;;
  }

  dimension: reply_to_force_new {
    type: yesno
    sql: ${TABLE}.reply_to_force_new ;;
  }

  dimension: res_id {
    type: number
    sql: ${TABLE}.res_id ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}.subject ;;
  }

  dimension: subtype_id {
    type: number
    sql: ${TABLE}.subtype_id ;;
  }

  dimension: template_id {
    type: number
    sql: ${TABLE}.template_id ;;
  }

  dimension: use_active_domain {
    type: yesno
    sql: ${TABLE}.use_active_domain ;;
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
    drill_fields: [id, mass_mailing_name, record_name, mail_activity_type.name, mail_activity_type.id]
  }
}
