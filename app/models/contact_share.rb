class ContactShare < ActiveRecord::Base
  attr_accessible :contact_id, :user_id

  validates :user_id, presence: true
  validates :contact_id, presence: true

  belongs_to(
    :user,
    :primary_key => :id,
    :foreign_key => :user_id,
    :class_name => "User"
  )

  belongs_to(
    :contact,
    :primary_key => :id,
    :foreign_key => :contact_id,
    :class_name => "Contact"
  )

end