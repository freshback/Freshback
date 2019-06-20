class User < ApplicationRecord
  attr_accessor :login
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :keshbacks, dependent: :destroy
         has_many :comments, dependent: :destroy

         has_attached_file :avatar, default_url: '/assets/missing.png'
         validates_attachment_content_type :avatar, content_type: ['image/jpeg', 'image/gif', 'image/png']

         validates :nickname, presence: :true, uniqueness: { case_sensitive: false }
         # validates_format_of :nickname, with: /\A\w+ +\w+\z/, multiline: true

         def self.find_for_database_authentication(warden_conditions)
           conditions = warden_conditions.dup
           login = conditions.delete(:login)
           where(conditions).where(['lower(nickname) = :value OR lower(email) = :value', { value: login.strip.downcase }]).first
         end

         def self.find_recoverable_or_initialize_with_errors(required_attributes, attributes, error = :invalid)
           (case_insensitive_keys || []).each { |k| attributes[k].try(:downcase!) }

           attributes = attributes.slice(*required_attributes)
           attributes.delete_if { |_key, value| value.blank? }

           if attributes.keys.size == required_attributes.size
             if attributes.key?(:login)
               login = attributes.delete(:login)
               record = find_record(login)
             else
               record = where(attributes).first
             end
           end
         end

         def self.find_record(login)
           where(['username = :value OR email = :value', { value: login }]).first
         end

end
