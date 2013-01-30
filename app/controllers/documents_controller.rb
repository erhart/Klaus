class DocumentsController < ApplicationController
before_filter :authenticate_user!, :only => [:destroy, :edit ]

  # GET /documents
  # GET /documents.json
  def index
    params.delete :utf8
    @documents = Document.filter(params)
    #@documents = Document.all
	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @document = Document.find(params[:id])
	
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.json
  def new
    @document = Document.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = Document.find(params[:id])
  end

  # POST /documents
  # POST /documents.json
  def create
    @document = Document.new(params[:document])

    #lessons semester prof doc_type
    i = Document.where("lesson_id = ? AND semester_id = ? AND prof_id = ? AND doc_type_id = ?", @document.lesson.id, @document.semester.id, @document.prof.id, @document.doc_type.id).size
    
    #name = docType_prof_fach_sem_zahl
	@document.name = (@document.doc_type.name+'_'+@document.prof.name+'_'+@document.lesson.name+'_'+@document.semester.name+'_'+i.to_s).parameterize
	$upName = @document.name
	
    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render json: @document, status: :created, location: @document }
      else
        format.html { render action: "new" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.json
  def update
    @document = Document.find(params[:id])
	
	@tmp = Document.new(params[:document])
	
	tmp2 = @document.name
	tempPath = "public/dokumente/"
	extName = File.extname(@document.file_url)
	
	i = Document.where("lesson_id = ? AND semester_id = ? AND prof_id = ? AND doc_type_id = ?", @tmp.lesson.id, @tmp.semester.id, @tmp.prof.id, @tmp.doc_type.id).size
    
    #name = docType_prof_fach_sem_zahl
	@document.name = (@tmp.doc_type.name+'_'+@tmp.prof.name+'_'+@tmp.lesson.name+'_'+@tmp.semester.name+'_'+i.to_s).parameterize
	
	$newPath = tempPath
	$newFile = @document.name+extName
	
	File.rename(tempPath+tmp2+extName, tempPath+@document.name+extName)

    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
    @tmp.destroy
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document = Document.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to documents_url }
      format.json { head :ok }
    end
  end
end
