require 'active_support/concern'

module Point
  extend ActiveSupport::Concern

  def current_level
    @current_level ||= Level.current(points)
  end

  def next_level
    @next_level ||= Level.next(points)
  end

  def points
    @points ||= checkins.count * Checkin::POINT_VALUE
  end

  def next_level_points
    next_level.try(:points) || 0
  end

  def level_name
    current_level.name if current_level
  end

  include ActionView::Helpers::AssetTagHelper
  def level_icon_url
    current_level.thumb_url('40x40!') if current_level
  end
end
