module ApplicationHelper
  def flash_class(level)
    case level.to_sym
    when :notice then "alert-info"
    when :success then "alert-success"
    when :error then "alert-danger"
    when :alert then "alert-warning"
    else "alert-#{flash_type}"
    end
  end
  def user_avatar(user)
    # TODO: user real avatar
    if user.avatar?
      user.avatar.url
    else
      asset_pack_path('media/images/user.png')
    end
  end

  def user_avatar_thumb(user)
    if user.avatar.file.present?
      user.avatar.thumb.url
    else
      asset_pack_path('media/images/user.png')
    end
  end

  def event_photo(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.url
    else
      asset_path('event.jpg')
    end
  end

  def event_thumb(event)
    photos = event.photos.persisted

    if photos.any?
      photos.sample.photo.thumb.url
    else
      asset_path('event_thumb.jpg')
    end
  end

  def fa_icon(icon_class)
    content_tag(:span, '', class: "fa fa-#{icon_class}")
  end
end
