class BandsController < ApplicationController

  def new
    @band = Band.new
    render :new
  end

  def index
    @bands = Band.all
    render :index
  end

  def create
    @band = Band.new(band_params)

    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :index
    end
  end

  def show
    current_band
    render :show
  end

  def edit
    current_band
    render :edit
  end

  def update
    current_band
    if @band.update_attributes(band_params)
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    current_band.destroy!
  end


  private
  def band_params
    params.require(:band).permit(:name)
  end



end
