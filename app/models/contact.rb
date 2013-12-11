class Contact < ActiveRecord::Base
  attr_accessible :name, :email, :user_id


  validates :name, presence: true
  validates :email, presence: true
  validates :user_id, presence: true

  belongs_to(
    :user,
    :primary_key => :id,
    :foreign_key => :user_id,
    :class_name => "User"
  )

  def self.contacts_for_user_id(user_id)
    sql = (<<-SQL)
      SELECT
        contacts.*
      FROM
        contacts
      LEFT OUTER JOIN
        contact_shares
      ON
        (contacts.id = contact_shares.contact_id)
      WHERE
        :user_id = contacts.user_id OR :user_id = contact_shares.user_id
    SQL
    self.find_by_sql([sql, :user_id => user_id])
  end
end