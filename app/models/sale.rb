class Sale < ActiveRecord::Base
  belongs_to :venue

  has_many :sale_lines, dependent: :delete_all
  accepts_nested_attributes_for :sale_lines, reject_if: proc { |attributes| attributes[:beverage_id].blank?}, allow_destroy: true
  has_many :beverages, through: :sale_lines

  validates :venue_id, :date, presence: true

  def self.search(search)
    if search
      includes(:venue).where('venues.name ILIKE ?', "%#{search}%")
    else
      all
    end
  end

  def total
    sale_lines.map do |i| i.subtotal end.sum
  end

  def items
    sale_lines.sum(:quantity)
  end

end
