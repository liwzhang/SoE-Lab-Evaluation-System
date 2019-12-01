# This class is used to help with model management for a general purpose.
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
