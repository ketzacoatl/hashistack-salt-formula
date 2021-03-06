# create consul-template config for the users formula, use the macro!

{#- we will use this macro to generate (render) some salt states for u #}
{%- from "consul/template-tool/macro.sls" import render_consul_monitor with context %}

{#- variables to pass to the macro when rendering the salt states #}
{%- set formula = "users" %}
{%- set cmd = "salt-call --local state.sls users" %}
{%- set tpl = "salt://users/consul-template.tpl" %}

{#- call the macro to render the salt states for this monitor #}
{{ render_consul_monitor(formula, cmd, tpl) }}
