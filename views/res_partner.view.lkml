# The name of this view in Looker is "Res Partner"
view: res_partner {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.res_partner`
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
  # This dimension will be called "Active" in Explore.

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: additional_info {
    type: string
    sql: ${TABLE}.additional_info ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
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

  dimension: comment {
    type: string
    sql: ${TABLE}.comment ;;
  }

  dimension: commercial_company_name {
    type: string
    sql: ${TABLE}.commercial_company_name ;;
  }

  dimension: commercial_partner_id {
    type: number
    sql: ${TABLE}.commercial_partner_id ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}.company_id ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: company_registry {
    type: string
    sql: ${TABLE}.company_registry ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
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

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: email_normalized {
    type: string
    sql: ${TABLE}.email_normalized ;;
  }

  dimension: employee {
    type: yesno
    sql: ${TABLE}.employee ;;
  }

  dimension: function {
    type: string
    sql: ${TABLE}.function ;;
  }

  dimension: industry_id {
    type: number
    sql: ${TABLE}.industry_id ;;
  }

  dimension: is_company {
    type: yesno
    sql: ${TABLE}.is_company ;;
  }

  dimension: lang {
    type: string
    sql: ${TABLE}.lang ;;
  }

  dimension: message_bounce {
    type: number
    sql: ${TABLE}.message_bounce ;;
  }

  dimension: message_main_attachment_id {
    type: number
    sql: ${TABLE}.message_main_attachment_id ;;
  }

  dimension: mobile {
    type: string
    sql: ${TABLE}.mobile ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: partner_gid {
    type: number
    value_format_name: id
    sql: ${TABLE}.partner_gid ;;
  }

  dimension: partner_latitude {
    type: string
    sql: ${TABLE}.partner_latitude ;;
  }

  dimension: partner_longitude {
    type: string
    sql: ${TABLE}.partner_longitude ;;
  }

  dimension: partner_share {
    type: yesno
    sql: ${TABLE}.partner_share ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: phone_sanitized {
    type: string
    sql: ${TABLE}.phone_sanitized ;;
  }

  dimension: picking_warn {
    type: string
    sql: ${TABLE}.picking_warn ;;
  }

  dimension: picking_warn_msg {
    type: string
    sql: ${TABLE}.picking_warn_msg ;;
  }

  dimension: ref {
    type: string
    sql: ${TABLE}.ref ;;
  }

  dimension_group: signup_expiration {
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
    sql: ${TABLE}.signup_expiration ;;
  }

  dimension: signup_token {
    type: string
    sql: ${TABLE}.signup_token ;;
  }

  dimension: signup_type {
    type: string
    sql: ${TABLE}.signup_type ;;
  }

  dimension: state_id {
    type: number
    sql: ${TABLE}.state_id ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: street2 {
    type: string
    sql: ${TABLE}.street2 ;;
  }

  dimension: title {
    type: number
    sql: ${TABLE}.title ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: tz {
    type: string
    sql: ${TABLE}.tz ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension: vat {
    type: string
    sql: ${TABLE}.vat ;;
  }

  dimension: website {
    type: string
    sql: ${TABLE}.website ;;
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

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      commercial_company_name,
      display_name,
      company_name,
      name,
      mail_message_res_partner_rel.count,
      mail_notification.count
    ]
  }
}
