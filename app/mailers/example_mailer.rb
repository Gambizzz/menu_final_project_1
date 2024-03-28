class ExampleMailer < ApplicationMailer
  default from: "jay.gardos@outlook.com"

  def example_email
    mail(to: 'anelisegambini@yahoo.fr', subject: 'test email' )
  end
end
