class Suggestion < ActiveRecord::Base

validates_uniqueness_of :name

SEX_TYPES = [
  # Displayed  Stored
  [ "boy",  "boy" ],
  [ "girl", "girl" ],
  [ "either", "either" ]
]

end
