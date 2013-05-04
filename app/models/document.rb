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
  validates :file, :presence => true
	def before_update      
		self.file_url = Path.combine($newPath, $newFile)
	end

    def self.filter(params)

        condition ={}
        condition[:prof_id] = params[:prof_id] if params[:prof_id]
        condition[:lesson_id] = params[:lesson_id] if params[:lesson_id]
        condition[:doc_type_id] = params[:doc_type_id] if params[:doc_type_id]
        condition[:semester_id] = params[:semester_id] if params[:semester_id]
        condition.each_pair { |key,value| condition.delete key if value == "" }

        documents = where condition

        documents
    end
end
