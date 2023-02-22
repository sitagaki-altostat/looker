# The name of this view in Looker is "Ir Model"
view: ir_model {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.ir_model`
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

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Create Uid" in Explore.

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

  dimension: info {
    type: string
    sql: ${TABLE}.info ;;
  }

  dimension: is_mail_activity {
    type: yesno
    sql: ${TABLE}.is_mail_activity ;;
  }

  dimension: is_mail_blacklist {
    type: yesno
    sql: ${TABLE}.is_mail_blacklist ;;
  }

  dimension: is_mail_thread {
    type: yesno
    sql: ${TABLE}.is_mail_thread ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}.model ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order {
    type: string
    sql: ${TABLE}.`order` ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: transient {
    type: yesno
    sql: ${TABLE}.transient ;;
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
