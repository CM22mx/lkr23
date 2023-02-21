view: order_items {
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
  }

  dimension_group: returned {
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
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
    link: {
      label: "XYZ"
      url: "/explore/cm_testing/order_items?fields=orders.count,orders.id&sorts=orders.count+desc+0&limit=500&column_limit=50
            &vis={
      \"type\":\"looker_grid\",
      \"table_theme\": \"unstyled\",
      \"show_view_names\":false,
      \"show_row_numbers\":false,
      \"transpose\":false,\"truncate_text\":true,
      \"hide_totals\":false,
      \"hide_row_totals\":false,
      \"size_to_fit\":false,
      \"table_theme\":\"white\",
      \"limit_displayed_rows\":false,
      \"enable_conditional_formatting\":false,
      \"header_text_alignment\":\"left\",
      \"header_font_size\":\"11\",
      \"rows_font_size\":\"11\",
      \"conditional_formatting_include_totals\":false,
      \"conditional_formatting_include_nulls\":false,
      \"show_sql_query_menu_options\":false,
      \"show_totals\":false,
      \"show_row_totals\":false,
      \"truncate_header\":false,
      \"series_cell_visualizations\":{\"orders.count:\":{\"is_active\":false}},
      \"defaults_version\":1}"
    }
    }


  measure: count {
    type: count
    drill_fields: [id, orders.id, inventory_items.id]
  }
}
