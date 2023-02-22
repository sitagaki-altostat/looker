# The name of this view in Looker is "Mail Channel Res Groups Rel"
view: mail_channel_res_groups_rel {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `sitagaki-odoo.public.mail_channel_res_groups_rel`
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Datastream Metadata Source Timestamp" in Explore.

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

  dimension: mail_channel_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.mail_channel_id ;;
  }

  dimension: res_groups_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.res_groups_id ;;
  }

  measure: count {
    type: count
    drill_fields: [mail_channel.name, mail_channel.id, res_groups.name, res_groups.id]
  }
}
