class Vote < ActiveRecord::Base
  belongs_to :user
  #include ActiveModel::Validations
end
