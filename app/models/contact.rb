class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true

  belongs_to :user

end
