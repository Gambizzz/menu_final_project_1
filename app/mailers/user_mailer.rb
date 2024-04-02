class UserMailer < ApplicationMailer
    default from: ENV['MAILJET_DEFAULT_FROM']

    def welcome_email(user)
      #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
      @user = user 
  
      #on définit une variable @url qu'on utilisera dans la view d’e-mail
      @url  = 'https://menuu-741b3999a7b7.herokuapp.com' 
  
      # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
      mail(to: @user.email, subject: 'Bienvenue chez nous !') 
    end

    def reservation_email(reservation)
      @reservation = reservation
      @user = User.find(reservation.user_id)
      @url = 'https://menuu-741b3999a7b7.herokuapp.com'
      mail(to: @user.email, subject: 'Réservation prise en compte')
    end
end
