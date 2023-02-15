view: employees {
  label: "employees_info"
  sql_table_name: demo_db.Employees ;;

  dimension: emp_id {
    type: number
    label: "emp_id"
    sql: ${TABLE}.EmpID ;;
  }

  dimension: manager {
    type: number
    label: "manager"
    sql: ${TABLE}.Manager ;;
  }

  dimension: name {
    type: string
    label: "name"
    sql: ${TABLE}.Name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }

  measure: selected_metric_custom_measure {
    label_from_parameter: par_metric_selected
    type: number
    sql:
    CASE
    WHEN {% parameter par_metric_selected %} = 'Waiting Time' THEN 1
    WHEN {% parameter par_metric_selected %} = 'First Response Time' THEN 2
    END;; }

  parameter: par_metric_selected {
    label: "Parameter Selected Metric"
    type: string
    allowed_value: { value: "Waiting Time" label: "Waiting Time" }
    allowed_value: { value: "First Response Time" label: "First Response Time" }
    default_value: "Waiting Time"
  }

}
