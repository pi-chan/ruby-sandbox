class User < ActiveRecord::Base
  User.default_connection = :slave1
end
