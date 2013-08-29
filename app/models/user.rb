class User < ActiveRecord::Base
  belongs_to :venue
  has_secure_password
  validates :username, :role, presence: true
  validates :username, uniqueness: true

  def self.search(search)
    if search
      includes(:venue).where('username ILIKE ? OR role ILIKE ? OR venues.name ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end

  def director?
    self.role == 'director'
  end

  def manager?
    self.role == 'manager' or self.role == 'director'
  end

  def supervisor?
    self.role == 'manager' or self.role == 'director' or self.role == 'supervisor'
  end

end
