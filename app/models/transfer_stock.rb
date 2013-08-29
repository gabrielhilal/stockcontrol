class TransferStock < ActiveRecord::Base
  belongs_to :sender, class_name: 'Venue'
  belongs_to :recipient, class_name: 'Venue'

  has_many :transfer_lines, dependent: :delete_all
  accepts_nested_attributes_for :transfer_lines, reject_if: proc { |attributes| attributes[:product_id].blank?}, allow_destroy: true

  has_many :products, through: :transfer_lines

  validates :date, :sender_id, presence: true
  validate :different_sender_and_recipient

  def different_sender_and_recipient
    if sender_id == recipient_id
       errors.add(:recipient_id, "can't be equal to sender")
    end
  end

  def items
    transfer_lines.sum(:quantity)
  end
end
