class AvatarUploader < CarrierWave::Uploader::Base
  # Подключим RMagick, чтобы можно было менять размер автарок
  # и делать миниатюрные версии

  # Файлы хранятся в спец. папке проекта локально
  include CarrierWave::RMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end
  
  # Папка, в которой будут храниться все наши загруженные файлы
  # например, uploads/avatar/avatar/1
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Аватарку, загруженную пользователем, надо обрезать и уменьшить
  # так, чтобы получился квадрат 400x400
  process resize_to_fill: [400, 400]

  # А потом нужно сделать миниатюрную версию 100x100
  version :thumb do
    process :resize_to_fit => [100, 100]
  end

  # Мы разрешаем для загрузки только файлы с расширением картинок
  def extension_white_list
    %w(jpg jpeg gif png)
  end
end