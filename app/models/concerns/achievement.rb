require 'active_support/concern'

module Achievement
  extend ActiveSupport::Concern

  module ClassMethods
    def current(points)
      where('points <= ?', points).order(points: :desc).first
    end

    def next(points)
      where('points > ?', points).order(points: :asc).first || max
    end

    def max
      order(points: :desc).first
    end
  end
end
