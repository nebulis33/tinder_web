class Like < ApplicationRecord
    validates_uniqueness_of :account_id, scope: :liked_account_id
end
