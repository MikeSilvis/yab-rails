require 'active_support/concern'

module Point
  extend ActiveSupport::Concern
  def points
    @points ||= if self.respond_to? :checkins_count
                  (checkins_count || 0) * Checkin::POINT_VALUE
                else
                  calculate_points
                end
  end

  def calculate_points
    checkins.count * Checkin::POINT_VALUE
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
