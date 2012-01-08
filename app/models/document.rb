class Document < ActiveRecord::Base
  belongs_to :lesson
  belongs_to :semester
  belongs_to :prof
  belongs_to :doc_type
  mount_uploader :file, FileUploader
  
	validates :lesson, :presence => true
	validates :semester, :presence => true
	validates :prof, :presence => true
	validates :doc_type, :presence => true
	def before_update      
		self.file_url = Path.combine($newPath, $newFile)
	end
end


