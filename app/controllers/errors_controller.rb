class ErrorsController < ApplicationController
  # GET /errors
  # GET /errors.xml
  def index
    @errors = Error.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @errors }
    end
  end

  # GET /errors/1
  # GET /errors/1.xml
  def show
    @error = Error.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @error }
    end
  end

  # GET /errors/new
  # GET /errors/new.xml
  def new
    @error = Error.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @error }
    end
  end

  # GET /errors/1/edit
  def edit
    @error = Error.find(params[:id])
  end

  # POST /errors
  # POST /errors.xml
  def create
    @error = Error.new(params[:error])

    respond_to do |format|
      if @error.save
        flash[:notice] = 'Error was successfully created.'
        format.html { redirect_to(@error) }
        format.xml  { render :xml => @error, :status => :created, :location => @error }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @error.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /errors/1
  # PUT /errors/1.xml
  def update
    @error = Error.find(params[:id])

    respond_to do |format|
      if @error.update_attributes(params[:error])
        flash[:notice] = 'Error was successfully updated.'
        format.html { redirect_to(@error) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @error.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /errors/1
  # DELETE /errors/1.xml
  def destroy
    @error = Error.find(params[:id])
    @error.destroy

    respond_to do |format|
      format.html { redirect_to(errors_url) }
      format.xml  { head :ok }
    end
  end
end
