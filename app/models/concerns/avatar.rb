require 'active_support/concern'

module Avatar
  extend ActiveSupport::Concern

  included do
    dragonfly_accessor :avatar
  end

  def thumb_url(dimensions)
    avatar.thumb(dimensions).url if avatar
  end
end
