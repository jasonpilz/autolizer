class User < ActiveRecord::Base
  has_many :vehicles
  has_many :trips, through: :vehicles

  def self.from_omniauth(auth_info)
    where(uid: auth_info["info"]["id"]).first_or_create do |new_user|
      new_user.uid                = auth_info["info"]["id"]
      new_user.first_name         = auth_info["info"]["first_name"]
      new_user.last_name          = auth_info["info"]["last_name"]
      new_user.email              = auth_info["info"]["email"]
      new_user.oauth_access_token = auth_info["credentials"]["token"]
      new_user.token_expires_at   = auth_info["credentials"]["expires_at"]
    end
  end
end
