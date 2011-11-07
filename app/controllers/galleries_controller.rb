class GalleriesController < ApplicationController
  before_filter :authenticate, :except => [:index, :show, :paintings, :thumbnail]

  def index
    @galleries = Gallery.all

    respond_to do |format|
      format.html
      format.json do
        render :json => @galleries
      end
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
    @painting = @gallery.paintings.build

    respond_to do |format|
      format.html
    end
  end

  def new
    @gallery = Gallery.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
  end

  def create
    @gallery = Gallery.new(params[:gallery])

    respond_to do |format|
      if @gallery.save
        format.html { redirect_to(@gallery, :notice => 'Gallery was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      if @gallery.update_attributes(params[:gallery])
        format.html { redirect_to(@gallery, :notice => 'Gallery was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy

    respond_to do |format|
      format.html { redirect_to(galleries_url) }
    end
  end

  def paintings
    @gallery = Gallery.find(params[:id])

    respond_to do |format|
      format.html
      format.json do
        render :json => @gallery.paintings
      end
    end
  end

  def thumbnail
    @gallery = Gallery.find(params[:id])

    redirect_to @gallery.paintings.first.picture.url('thumb')
  end
end
