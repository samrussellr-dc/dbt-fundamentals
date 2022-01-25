{% macro limit_data_in_dev(column_name,days_of_data) -%}
{% if target.name == 'dev' %}
    where {{ column_name }} >= dateadd('day', - {{ days_of_data }}, current_timestamp )
{% endif %}
{% endmacro %}