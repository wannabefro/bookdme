class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
      ContactMailer.contact_form(@contact).deliver
      ContactMailer.admin_contact_form(@contact).deliver
      redirect_to root_path, notice: "Thanks for getting in touch. We'll respond as soon as we can."
    else
      render 'new'
    end
  end

end
