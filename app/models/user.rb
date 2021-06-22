class User < ActiveRecord::Base
    has_many :books
    validates_uniqueness_of :username
    has_secure_password
end