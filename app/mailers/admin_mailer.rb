class AdminMailer < ApplicationMailer
  default from: ENV['MAILJET_DEFAULT_FROM']

  def welcome_email(admin)
    @admin = admin
    @url  = 'https://menuu-741b3999a7b7.herokuapp.com' 
    mail(to: @admin.email, subject: 'Bienvenue chez nous !') 
  end

  def reservation_email(reservation)
    @reservation = reservation
    @restaurant = @reservation.restaurant
    @admin = @restaurant.admin
    @url = 'https://menuu-741b3999a7b7.herokuapp.com'
    mail(to: @admin.email, subject: 'Nouvelle réservation dans votre établissement')
  end

  def restaurant_email(restaurant)
    @restaurant = restaurant
    @admin = Admin.find(@restaurant.admin_id)
    @url = 'https://menuu-741b3999a7b7.herokuapp.com'
    mail(to: @admin.email, subject: 'Félicitations, vous venez de créer votre restaurant !')
  end

  def cancel_email(admin, reservation)
    @reservation = reservation
    @restaurant = @reservation.restaurant
    @admin = @restaurant.admin
    @url = 'https://menuu-741b3999a7b7.herokuapp.com'
    mail(to: @admin.email, subject: 'Un client a annulé sa réservation')
  end
end
