class Reward < ActiveRecord::Base
  belongs_to :merchant
  include Achievement
end
