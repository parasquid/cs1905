module PreferencesHelper

  # check_box_tag(name, value = "1", checked = false, options = {})

  # Generates the preferences check box tags, given a preference object field
  def preference_check_box_tags(field, options={})
    Preference.notification_options.map do |value|
      check_box_tag("preference[#{field}][]", value,
                    @preference.send(field.to_sym) && @preference.send(field.to_sym).include?(value),
                    options
                    )
    end.join('</td><td class=\'check-boxes\'>').html_safe
  end

  # Generates the category check box tags, given a preference.challenge object field
  def category_check_box_tags(field, options={})
    Preference.notification_options.map do |value|
      check_box_tag("preference[categories][#{field}][]", value,
                    @preference.categories[field] && @preference.categories[field].include?(value),
                    options
                    )
    end.join('</td><td class=\'check-boxes\'>').html_safe
  end
end
