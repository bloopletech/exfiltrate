class Blob < ActiveRecord::Base
  include AASM

  belongs_to :site

  attachment :response_body

  aasm do
    state :new, initial: true
    state :requested

    event :request do
      transitions from: :new, to: :requested
    end
  end
end