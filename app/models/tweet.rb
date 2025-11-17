class Tweet < ApplicationRecord
end
def self.ransackable_attributes(auth_object = nil)
    [ "body", "name" ]
  end
