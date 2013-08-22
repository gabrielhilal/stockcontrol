class Purchase < ActiveRecord::Base
  belongs_to :venue
  belongs_to :supplier

  has_many :purchase_lines, dependent: :delete_all
  accepts_nested_attributes_for :purchase_lines, reject_if: proc { |attributes| attributes[:product_id].blank?}, allow_destroy: true

  has_many :products, through: :purchase_lines

  validates :no, :date, :venue_id, :supplier_id, presence: true

  def self.search(search)
    if search
      includes(:venue, :supplier).where('no ILIKE ? or suppliers.name ILIKE ? or venues.name ILIKE ?', "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end

  def total
    purchase_lines.map do |i| i.subtotal end.sum
  end

  def items
    purchase_lines.sum(:quantity)
  end
end
