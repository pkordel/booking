class BookingsController < ApplicationController
  include CalendarHelper
  before_filter :get_room
  # GET /bookings
  # GET /bookings.xml
  def index
    @bookings = @room.bookings.find(:all)
    @year = Date.today.year
    @month = Date.today.month
    
    listOfSpecialDays = [1.day.from_now.day]
    listOfSpecialDays = []
    
    @calendar = calendar(	:year => @year, :month => @month, 
  							 	:table_class => "calendar",
      					 	:month_name_class => "monthName",
      						:day_name_class => "dayName",
      						:day_class => "day") do |d|
      if d.mday == 23          # (days that are in the array listOfSpecialDays) one CSS class,
        [d.mday, {:class => "specialDay"}]      # "specialDay", and gives the rest of the days another CSS class,
          else                                  # "normalDay". You can also use this highlight today differently
        [d.mday, {:class => "normalDay"}]       # from the rest of the days, etc.
      end
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bookings }
    end
  end

  # GET /bookings/1
  # GET /bookings/1.xml
  def show
    @booking = @room.bookings.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @booking }
    end
  end

  # GET /bookings/new
  # GET /bookings/new.xml
  def new
    @booking = Booking.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @booking }
    end
  end

  # GET /bookings/1/edit
  def edit
    @booking = @room.bookings.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.xml
  def create
    @booking = @room.bookings.build(params[:booking])

    respond_to do |format|
      if @booking.save
        flash[:notice] = 'Booking was successfully created.'
        format.html { redirect_to property_url(@room.property) }
        format.xml  { render :xml => @booking, :status => :created, :location => @booking }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @booking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bookings/1
  # PUT /bookings/1.xml
  def update
    @booking = @room.bookings.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(params[:booking])
        flash[:notice] = 'Booking was successfully updated.'
        format.html { redirect_to property_room_bookings_url(@property, @room) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @booking.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.xml
  def destroy
    @booking = @room.bookings.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to property_room_bookings_url(@property, @room) }
      format.xml  { head :ok }
    end
  end
  
  protected
  
  def get_room
    @property = Property.find(params[:property_id])
    @room = @property.rooms.find(params[:room_id]) if @property
  end
end
