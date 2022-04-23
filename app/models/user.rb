# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  email              :string(255)      not null
#  encrypted_password :string(255)      default(""), not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

#
# = 会員
#
class User < ApplicationRecord
end
