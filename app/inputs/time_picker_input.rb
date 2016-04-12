class TimePickerInput < SimpleForm::Inputs::Base
  def input(wrapper_options)
    template.content_tag(:div, class: "input-append bootstrap-timepicker-component style='display: inline;'") do
      template.concat @builder.text_field(attribute_name, input_html_options)
      template.concat span_time
    end
  end

  def input_html_options
    super.merge({class: 'dateselect-time input-small', data: { time: nil }, readonly: false})
  end

  def span_time
    template.content_tag(:span, class: 'add-on') do
      template.concat icon_time
    end
  end

  def icon_time
    "<i class='fa fa-time'></i>".html_safe
  end
end
