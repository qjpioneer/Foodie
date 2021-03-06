class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! ,except: [:index, :show]
  # GET /stores
  # GET /stores.json
  

  
  def search
    if params[:search].present?
      @stores = Store.search(params[:search])
    else
      @stores = Store.all
    end
  end





  def index
    @stores = Store.all
    if user_signed_in?
      @store = current_user.stores.build
    else
      @store=Store.new
    end
  end

  # GET /stores/1
  # GET /stores/1.json
  def show
    @reviews = Review.where(store_id: @store.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end

    @store.avg_rating = @avg_review
    @store.save
  end

  # GET /stores/new
  def new
    #@store = Store.new  改成目前登入使用者下的store
    @store = current_user.stores.build
  end

  # GET /stores/1/edit
  def edit
    
  end

  # POST /stores
  # POST /stores.json
  def create
    #@store = Store.new(store_params)
    @store = current_user.stores.build(store_params)

    respond_to do |format|
      if @store.save
        format.html { redirect_to stores_path, notice: 'Store was successfully created.' }
        format.json { render :show, status: :created, location: @store }
        #for ajax
        format.js
      else
        format.html { render :new }
        format.json { render json: @store.errors, status: :unprocessable_entity }
        #for ajax
        format.js
      end
    end
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
    respond_to do |format|
      if @store.update(store_params)
        format.html { redirect_to @store, notice: 'Store was successfully updated.' }
        format.json { render :show, status: :ok, location: @store }
      else
        format.html { render :edit }
        format.json { render json: @store.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    respond_to do |format|
      format.html { redirect_to stores_url, notice: 'Store was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:name, :phone, :rate, :address, :category, :img)
    end
end
