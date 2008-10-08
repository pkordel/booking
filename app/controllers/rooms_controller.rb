class RoomsController < ApplicationController
  before_filter :get_property
  # GET /rooms
  # GET /rooms.xml
  def index
    @rooms = @property.rooms

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rooms }
    end
  end

  # GET /rooms/1
  # GET /rooms/1.xml
  def show
    @room = @property.rooms.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @room }
    end
  end

  # GET /rooms/new
  # GET /rooms/new.xml
  def new
    @room = Room.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @room }
    end
  end

  # GET /rooms/1/edit
  def edit
    @room = @property.rooms.find(params[:id])
  end

  # POST /rooms
  # POST /rooms.xml
  def create
    @room = @property.rooms.build(params[:room])

    respond_to do |format|
      if @room.save
        flash[:notice] = 'Room was successfully created.'
        format.html { redirect_to(property_url(@property)) }
        format.xml  { render :xml => @room, :status => :created, :location => @room }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rooms/1
  # PUT /rooms/1.xml
  def update
    @room = @property.rooms.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(params[:room])
        flash[:notice] = 'Room was successfully updated.'
        format.html { redirect_to(property_url(@property)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @room.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.xml
  def destroy
    @room = @property.rooms.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to(property_url(@property)) }
      format.xml  { head :ok }
    end
  end
  
protected

  def get_property
    @property = Property.find(params[:property_id])
  end

end
