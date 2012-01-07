class Document < ActiveRecord::Base
  #attr_accessible :id, :name, :file, :remote_file_url
  belongs_to :lesson
  belongs_to :semester
  belongs_to :prof
  belongs_to :doc_type
  mount_uploader :file, FileUploader
end
