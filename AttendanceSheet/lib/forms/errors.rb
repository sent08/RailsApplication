ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag =~ /<(label)/
    html_tag
  else
    <<-html
      #{html_tag}
        <div class="half_margin_left half_margin_right" style ="float:left; font-size:10px; color:red;">
          <label for="#{instance.object_name}_#{instance.method_name}">
            #{
              begin
                "#{instance.object_name.classify.constantize.attribute_name_for_display(instance.method_name).capitalize} #{Array(instance.error_message).first}"
              rescue
#                            logger.add(
#                              1,
#                              "
#[EXCEPTION] users#signup (ActionView::TemplateError) \"undefined method `attribute_name_for_display' for #<Class:0xf6716334>\"
#instance.object_name: #{instance.object_name}
#instance.object_name.classify: #{instance.object_name.classify}
#instance.object_name.classify.constantize: #{instance.object_name.classify.constantize}
#instance.object_name.classify.constantize.respond_to?(:attribute_name_for_display): #{instance.object_name.classify.constantize.respond_to?(:attribute_name_for_display)}
#                              "
#                            )
                "#{instance.method_name.humanize} #{Array(instance.error_message).first}"
              end
            }
          </label>
        </div>
    html
  end
end