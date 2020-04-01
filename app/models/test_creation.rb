class TestCreation < ApplicationRecord
  belongs_to :creation, class_name: "Test"
  belongs_to :creator, class_name: "User"
end
