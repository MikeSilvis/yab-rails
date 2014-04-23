class Merchant < ActiveRecord::Base
  has_many :locations
  has_many :users
  has_many :rewards
  accepts_nested_attributes_for :locations, allow_destroy: true
  accepts_nested_attributes_for :users, allow_destroy: true
  accepts_nested_attributes_for :rewards, allow_destroy: true
  belongs_to :user
  validates :user, presence: true
  include Avatar
  attr_accessor :for_user

  STATES = {
    demand_generation: 'Demand Generation',
    lead: 'Lead',
    develop: 'Develop',
    demo: 'Demo / Proof',
    close: 'Close',
    deploy: 'Deploy'
  }
  include AASM

  aasm do
    STATES.each do |key, human_readable|
      state key
    end
  end

  def human_state
    STATES[aasm_state.to_sym]
  end
end
