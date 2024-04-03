class Restaurant < ApplicationRecord
    validates :restaurant_name, presence: true
    validates :city, presence: true

    belongs_to :admin
    belongs_to :city
    has_one_attached :image, dependent: :destroy
    has_many :comments, dependent: :destroy
    has_many :reservations, dependent: :destroy
    has_many :favorites, dependent: :destroy

    after_create :restaurant_send

    def restaurant_send
      AdminMailer.restaurant_email(self).deliver_now
    end
  end
