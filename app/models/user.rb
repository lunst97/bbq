class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :vkontakte]

  has_many :events, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :subscriptions, dependent: :destroy

  validates :name, presence: true, length: { maximum: 35 }

  before_validation :set_name, on: :create
  after_commit :link_subscriptions, on: :create

  mount_uploader :avatar, AvatarUploader

  def self.find_for_oauth(access_token)
    binding.pry
    email = access_token.info.email
    user = where(email: email).first

    return user if user.present?

    provider = access_token.provider
    id = access_token.extra.raw_info.id

    case provider
    when 'facebook'
      name = access_token.info.name
      image_url = access_token.info.image.gsub('http://','https://')
      url = "https://facebook.com/#{id}"
    when 'vkontakte'
      name = access_token.extra.raw_info.first_name
      image_url = access_token.extra.raw_info.photo_400_orig.gsub('http://','https://')
      url = "https://vk.com/id#{id}"
    end

    where(url: url, provider: provider).first_or_create! do |user|
      user.name = name
      user.remote_avatar_url = image_url
      user.email = email
      user.password = Devise.friendly_token.first(16)
    end
  end

  def send_device_notification(notification, *args)
    devise_mailer.send(notification, self, *args).deliver_leter
  end

  private

  def set_name
    self.name = "Товарисч №[#{rand(1337)}]" if self.name.blank?
  end

  def link_subscriptions
    Subscription.where(user_id: nil, user_email: self.email)
                .update_all(user_id: self.id)
  end
end
