class User < ActiveRecord::Base
  # belongs_to :admin
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         def self.search(query)
          if query.present?
            where("first_name @@ :q", "group_id @@ :q", q: query)
          else
            all
          end
           
         end

  has_many :reservations
  has_one :boat
  belongs_to :group
end
