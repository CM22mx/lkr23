view: users {
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
    drill_fields: [email,age]
    html: {% if value =="Abbeville" %}
     <p style="font-size:200%;"> head</p>
    <p style="color: green; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% elsif value=="Ada" %}
       <p style="font-size:200%;"> head</p>
      <p style="color: red; font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% else %}
       <p style="font-size:200%;"> head</p>
      <p style="color:yellow;  font-size:100%; text-align:center">{{ rendered_value }}</p>
    {% endif %}
    ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension_group: created {
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

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
    link: {
      label: "Drill as scatter plot"
      url: "{ % assign vis_config = '{
          \"x_axis_gridlines\":false, \"y_axis_gridlines\":true\"}' %}
  \{\{ city._link \}\}&vis_config=\{\{ vis_config | encode_uri \}\}&toggle=dat,pik,vis&limit=5000"

}
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
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
      first_name,
      last_name,
      events.count,
      orders.count,
      saralooker.count,
      sindhu.count,
      user_data.count
    ]
  }
}
