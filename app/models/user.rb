class User < ApplicationRecord
  DEVISE_MODULES = %i[database_authenticatable registerable recoverable rememberable validatable trackable]

  devise(*DEVISE_MODULES)
end
