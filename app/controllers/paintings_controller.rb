class PaintingsController < ApplicationController
  before_filter :authenticate, :except => [:show, :download]

  def download
    redirect_to Painting.find(params[:id]).picture.url(params[:style])
  end

  def show
    @painting = Painting.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def edit
    @painting = Painting.find(params[:id])
  end
    
  def create
    @painting = Painting.create(params[:painting])
    @gallery = @painting.gallery

    respond_to do |format|
      if @painting.save
        format.html { redirect_to(@gallery, :notice => 'Painting was successfully created.') }
      else
        format.html { render 'galleries/show' }
      end
    end
  end

  def update
    @painting = Painting.find(params[:id])
    @gallery = @painting.gallery
        
    respond_to do |format|
      if @painting.update_attributes(params[:painting])
        format.html { redirect_to(@gallery, :notice => 'Painting was successfully updated.') }
      else
        format.html { render 'galleries/show' }
      end
    end
  end
    
  def destroy
    @painting = Painting.find(params[:id])

    respond_to do |format|
      if @painting.destroy
        format.html { redirect_to(@painting.gallery) }
      else
        format.html { render :show }
      end
    end
  end
end
