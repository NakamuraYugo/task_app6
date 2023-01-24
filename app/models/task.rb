class Task < ApplicationRecord


  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 65_500 }
  validates :start_date, presence: true
  validates :end_date, presence: true
  
  validate :start_end_check

  def start_end_check
    if start_date.present? && end_date.present? && (start_date.after? end_date)
      errors.add(:base, "開始日は終了日よりも後の日付を選ぶことはできません。")
    end
  end

end
