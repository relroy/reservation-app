class User < ActiveRecord::Base

  after_create :send_admin_email

  # belongs_to :admin
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

         def self.search(query)
          if query.present?
            where("first_name @@ :q or group_id @@ :q", q: query)
          else
            all
          end
           
         end

  has_many :reservations
 
  belongs_to :group

  belongs_to :reservation

  def send_admin_email

   UserMailer.signup_confirmation(@admin, first_name, last_name, email, phone, id).deliver
    puts "admin"
  end


end
