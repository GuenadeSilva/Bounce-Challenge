{% test row_count(model, column_name, equal) %}
    select row_count
    from (select count({{ column_name }}) as row_count from {{ model }})
    where row_count < {{ equal }}
{% endtest %}