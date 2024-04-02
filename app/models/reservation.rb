class Reservation < ApplicationRecord
  after_create :reservation_send

  belongs_to :restaurant
  belongs_to :user


  validates :number, presence: true
  validates :date, presence: true
  validates :time, presence: true

  def reservation_send
    UserMailer.reservation_email(self).deliver_now
    AdminMailer.reservation_email(self).deliver_now
  end
end
