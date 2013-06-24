class ContactMailer < ActionMailer::Base
  default from: "bookdme@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_form.subject
  #
  def contact_form(contact)
    @contact = contact

    mail to: contact.email, subject: "Thanks for getting in touch"
  end

  def admin_contact_form(contact)
    @contact = contact

    mail to: 'info@bookd.me', subject: "Contact form submitted"
  end
end
