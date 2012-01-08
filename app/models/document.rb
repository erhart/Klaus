class Document < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :semester
  belongs_to :prof
  belongs_to :doc_type  
end
