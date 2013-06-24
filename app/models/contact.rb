class Contact < ActiveRecord::Base
  attr_accessible :email, :message, :name, :subject, :user_id

  belongs_to :user
  validates_presence_of :name, :email, :subject, :message
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i
end
