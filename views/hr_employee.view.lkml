# The name of this view in Looker is "Hr Employee"
view: hr_employee {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.hr_employee`
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

  dimension: additional_note {
    type: string
    sql: ${TABLE}.additional_note ;;
  }

  dimension: address_home_id {
    type: number
    sql: ${TABLE}.address_home_id ;;
  }

  dimension: address_id {
    type: number
    sql: ${TABLE}.address_id ;;
  }

  dimension: bank_account_id {
    type: number
    sql: ${TABLE}.bank_account_id ;;
  }

  dimension: barcode {
    type: string
    sql: ${TABLE}.barcode ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: birthday {
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
    sql: ${TABLE}.birthday ;;
  }

  dimension: certificate {
    type: string
    sql: ${TABLE}.certificate ;;
  }

  dimension: children {
    type: number
    sql: ${TABLE}.children ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_children {
    type: sum
    sql: ${children} ;;
  }

  measure: average_children {
    type: average
    sql: ${children} ;;
  }

  dimension: coach_id {
    type: number
    sql: ${TABLE}.coach_id ;;
  }

  dimension: color {
    type: number
    sql: ${TABLE}.color ;;
  }

  dimension: company_id {
    type: number
    sql: ${TABLE}.company_id ;;
  }

  dimension: country_id {
    type: number
    sql: ${TABLE}.country_id ;;
  }

  dimension: country_of_birth {
    type: number
    sql: ${TABLE}.country_of_birth ;;
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

  dimension: department_id {
    type: number
    sql: ${TABLE}.department_id ;;
  }

  dimension_group: departure {
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
    sql: ${TABLE}.departure_date ;;
  }

  dimension: departure_description {
    type: string
    sql: ${TABLE}.departure_description ;;
  }

  dimension: departure_reason_id {
    type: number
    sql: ${TABLE}.departure_reason_id ;;
  }

  dimension: emergency_contact {
    type: string
    sql: ${TABLE}.emergency_contact ;;
  }

  dimension: emergency_phone {
    type: string
    sql: ${TABLE}.emergency_phone ;;
  }

  dimension: employee_type {
    type: string
    sql: ${TABLE}.employee_type ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: identification_id {
    type: string
    sql: ${TABLE}.identification_id ;;
  }

  dimension: job_id {
    type: number
    sql: ${TABLE}.job_id ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: km_home_work {
    type: number
    sql: ${TABLE}.km_home_work ;;
  }

  dimension: marital {
    type: string
    sql: ${TABLE}.marital ;;
  }

  dimension: message_main_attachment_id {
    type: number
    sql: ${TABLE}.message_main_attachment_id ;;
  }

  dimension: mobile_phone {
    type: string
    sql: ${TABLE}.mobile_phone ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: passport_id {
    type: string
    sql: ${TABLE}.passport_id ;;
  }

  dimension: permit_no {
    type: string
    sql: ${TABLE}.permit_no ;;
  }

  dimension: pin {
    type: string
    sql: ${TABLE}.pin ;;
  }

  dimension: place_of_birth {
    type: string
    sql: ${TABLE}.place_of_birth ;;
  }

  dimension: resource_calendar_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.resource_calendar_id ;;
  }

  dimension: resource_id {
    type: number
    sql: ${TABLE}.resource_id ;;
  }

  dimension: sinid {
    type: string
    sql: ${TABLE}.sinid ;;
  }

  dimension_group: spouse_birthdate {
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
    sql: ${TABLE}.spouse_birthdate ;;
  }

  dimension: spouse_complete_name {
    type: string
    sql: ${TABLE}.spouse_complete_name ;;
  }

  dimension: ssnid {
    type: string
    sql: ${TABLE}.ssnid ;;
  }

  dimension: study_field {
    type: string
    sql: ${TABLE}.study_field ;;
  }

  dimension: study_school {
    type: string
    sql: ${TABLE}.study_school ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  dimension_group: visa_expire {
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
    sql: ${TABLE}.visa_expire ;;
  }

  dimension: visa_no {
    type: string
    sql: ${TABLE}.visa_no ;;
  }

  dimension: work_contact_id {
    type: number
    sql: ${TABLE}.work_contact_id ;;
  }

  dimension: work_email {
    type: string
    sql: ${TABLE}.work_email ;;
  }

  dimension: work_location_id {
    type: number
    sql: ${TABLE}.work_location_id ;;
  }

  dimension_group: work_permit_expiration {
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
    sql: ${TABLE}.work_permit_expiration_date ;;
  }

  dimension: work_permit_scheduled_activity {
    type: yesno
    sql: ${TABLE}.work_permit_scheduled_activity ;;
  }

  dimension: work_phone {
    type: string
    sql: ${TABLE}.work_phone ;;
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
    drill_fields: [id, spouse_complete_name, name, resource_calendar.name, resource_calendar.id]
  }
}
