class User < ApplicationRecord
  has_many :reservations, dependent: :destroy

  # 必須チェック
  validates :name, presence: true
  validates :phone_number, presence: true, uniqueness: true

    # 電話番号フォーマット（簡易例）
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "はハイフンなしの10桁または11桁で入力してください" }
end
