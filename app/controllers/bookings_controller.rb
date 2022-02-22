class BookingsController < ApplicationController
  
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @stadium = current_user.bookings.includes(:stadiums).find(params[:id])
  end
  
  def new
    @booking = current_user.bookings.build
  end

  def edit
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    @Stadium = Stadium.bookings.build(booking_params)
    
    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: "Stadium was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to @booking, notice: "Stadium was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @booking = Stadium.find(params[:id])
    @booking.destroy
    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Stadium was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

  def set_booking
    @booking = Stadium.find(params[:id])
  end

  def booking_params
    params.permit(:date, :start_time, :end_time, :user_id, :stadium_id)
  end

end
