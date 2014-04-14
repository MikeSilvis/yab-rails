class Merchant < ActiveRecord::Base
  has_many :locations
  has_many :users
  dragonfly_accessor :avatar
  accepts_nested_attributes_for :locations, allow_destroy: true
  accepts_nested_attributes_for :users, allow_destroy: true
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
