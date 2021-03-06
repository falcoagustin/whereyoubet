class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                    default_url: "default-person.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  after_create :send_email

  def send_email
    begin
      UserMailer.welcome_email(self).deliver_later
    rescue
      return UserMailer::ERROR_MESSAGE
    end
  end

  def is_admin_user
    return self.is_admin
  end
end
