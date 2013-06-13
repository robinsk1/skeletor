class ArtistsController < ApplicationController
  # GET /artists
  # GET /artists.json
  def index
    if params[:festival_id].blank?
      @grouped = {}
      Artist.all.each do |artist|
        letter = artist.name.slice(0,1).upcase
        @grouped[letter] ||= []
        @grouped[letter] << artist
      end
        render 'alphalist'
      return
    else
      @festival = Festival.find(params[:festival_id])
      @artists = Festival.find(params[:festival_id]).editions.first.artists.paginate(:page => params[:page])
    end

    respond_to do |format|
      format.html # index.html.erb
      format.js
      format.json { render json: @artists }
    end
  end

  def isotope
    @artists = Artist.limit(100)
  end

  # GET /artists/1
  # GET /artists/1.json
  def show
    @artist = Artist.find(params[:id])
    artist = Echonest::Artist.new(ENV['ECHONEST_API_KEY'], URI.escape(@artist.name))
    @bios = {}
    begin
      bios = artist.biographies
      @bios[:text] = bios[0].text
      @bios = @bios.merge(:url => bios[0].url )
      @blogs = artist.blogs
    rescue Exception => e
      @bios = nil
      @blogs = nil
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @artist }
    end
  end

  # GET /artists/new
  # GET /artists/new.json
  def new
    @artist = Artist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @artist }
    end
  end

  # GET /artists/1/edit
  def edit
    @artist = Artist.find(params[:id])
  end

  # POST /artists
  # POST /artists.json
  def create
    @artist = Artist.new(params[:artist])

    respond_to do |format|
      if @artist.save
        format.html { redirect_to @artist, notice: 'Artist was successfully created.' }
        format.json { render json: @artist, status: :created, location: @artist }
      else
        format.html { render action: "new" }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /artists/1
  # PUT /artists/1.json
  def update
    @artist = Artist.find(params[:id])

    respond_to do |format|
      if @artist.update_attributes(params[:artist])
        format.html { redirect_to @artist, notice: 'Artist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @artist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /artists/1
  # DELETE /artists/1.json
  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    respond_to do |format|
      format.html { redirect_to artists_url }
      format.json { head :no_content }
    end
  end
end
