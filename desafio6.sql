SELECT 
    MIN(plan_value) AS faturamento_minimo,
    MAX(plan_value) AS faturamento_maximo,
    ROUND(AVG(plan_value), 2) AS faturamento_medio,
    SUM(plan_value) AS faturamento_total
FROM
    plans_users
        INNER JOIN
    plan_values ON plans_users.plan_value_id = plan_values.id
        INNER JOIN
    users ON plans_users.users_id = users.id;