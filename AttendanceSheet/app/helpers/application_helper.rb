# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def around_partial(partial, locals = {}, &block)
    render(:partial => partial, :locals => locals.merge(:inner_content => capture(&block)))
  end

  def javascript_sources
    [ :defaults,
      'scriptaculous',
      'calendar_date_select/calendar_date_select'
    ]
  end

  def stylesheet_sources
    [ 'application',
      'mixins',
      'constants',
      'predefined',
      'calendar_date_select/default'
    ]
  end
end
