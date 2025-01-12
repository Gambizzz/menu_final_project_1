class Admin < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Entrez une adresse email valide." }
        
  has_many :restaurants 
  has_many :reservations, through: :restaurants 

  after_create :welcome_send

  def welcome_send
    AdminMailer.welcome_email(self).deliver_now
  end
end
