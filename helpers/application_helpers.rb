module ApplicationHelpers
  def svg(name)
    root = Middleman::Application.root
    images_path = config[:images_dir]
    file_path = "#{root}/source/#{images_path}/#{name}.svg"

    return File.read(file_path) if File.exists?(file_path)
    "(SVG not found)"
  end

  def default_event_link
    'https://www.facebook.com/pg/dedhamcycleclub/events/'
  end

  def event_location(event)
    if event.location
      if event.type === 'Bike Ride'
        content_tag(:span, 'Starts at')
        event.location
      else
        event.location
      end
    else
      'Location TBD'
    end
  end
end
