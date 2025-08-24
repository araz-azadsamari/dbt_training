{% macro limit_data_in_dev(column_name) %}
{% if target.name=='Development' %}
where {{column_name}}>= dateadd('year',-4,current_date)
{% endif %}
{% endmacro %}