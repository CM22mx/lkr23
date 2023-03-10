view: orders {
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
    label: "{% if _filters['created_date'] == ' '%}'default'{% else %}'Revenue'{{_filters['created_date']}}{% endif %}"
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
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    label: "{% if _filters['status'] == ''%}'Orders_1'{% else %}{{_filters['status']}}{% endif %}"
    type: string
    sql: ${TABLE}.status ;;
  }
  dimension: image_test {
    type: string
    sql: ${TABLE}.id;;
    html: <img src="https://logo-core.clearbit.com/looker.com" /> ;;
  }
  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }
  measure: set {
    type: number
    sql: ${count}-3 ;;
    #value_format: "[>0]+0;[=0]0;-0"
    html: {% if orders.set._value >=0 %}<font color="red"> {{rendered_value}} setting</font>
    {%else%}<font color="green"> {{rendered_value}}setting</font>
    {%endif%};;

  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      billion_orders.count,
      fakeorders.count,
      hundred_million_orders.count,
      hundred_million_orders_wide.count,
      order_items.count,
      order_items_vijaya.count,
      ten_million_orders.count
    ]
  }
}
