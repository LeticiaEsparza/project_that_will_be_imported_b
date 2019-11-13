connection: "thelook"

# include all the views
include: "*.view"
# include: "//test_pi/small_test_table.view"

# include all the dashboards
#include: "*.dashboard"

datagroup: project_that_will_be_imported_b_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: project_that_will_be_imported_b_default_datagroup


explore: events {
  label: "@{test}"
  join: users {
    type: left_outer
    sql_on: ${events.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: inventory_items {
  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }
}

explore: order_items {
  join: inventory_items {
    type: left_outer
    sql_on: ${order_items.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    type: left_outer
    sql_on: ${order_items.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: orders {
  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}

explore: products {}

explore: test {
  view_name: order_items
  extends: [order_items,orders]
}

explore: schema_migrations {}

explore: user_data {
  join: users {
    type: left_outer
    sql_on: ${user_data.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}
explore: user_facts {}

explore: users {}

explore: users_nn {}


explore: test_explore {
  hidden: yes
  from: order_items
  #fields: [ALL_FIELDS*, -test_explore.id, -test_explore.inventory_item_id, -test_explore.order_id]
  #fields: [ALL_FIELDS*, -test_explore.test*]
  #fields: [test_explore.test*]
  join: inventory_items {
    type: left_outer
    sql_on: ${test_explore.inventory_item_id} = ${inventory_items.id} ;;
    relationship: many_to_one
  }

  join: orders {
    fields: [orders.orders_set*]
    type: left_outer
    sql_on: ${test_explore.order_id} = ${orders.id} ;;
    relationship: many_to_one
  }

  join: products {
    type: left_outer
    sql_on: ${inventory_items.product_id} = ${products.id} ;;
    relationship: many_to_one
  }

  join: users {
    type: left_outer
    sql_on: ${orders.user_id} = ${users.id} ;;
    relationship: many_to_one
  }
}
