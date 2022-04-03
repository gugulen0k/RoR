class MerchantsController < ApplicationController
  before_action :set_merchant, only: %i[ show edit update destroy ]

  # GET /merchants or /merchants.json
  def index
    @user = current_user
    redirect_to root_path, warning: "You don't have admin rights to visit this page" unless @user.admin?

    @merchants = Merchant.all
  end

  def search
    @merchants = Merchant.where("name ILIKE ?", "%" + params[:q] + "%")
  end

  # GET /merchants/1 or /merchants/1.json
  def show
    @user = current_user
    redirect_to root_path, warning: "You don't have admin rights to visit this page" unless @user.admin?
  end

  # GET /merchants/new
  def new
    @user = current_user
    redirect_to root_path, warning: "You don't have admin rights to visit this page" unless @user.admin?

    @merchant = Merchant.new
  end

  # GET /merchants/1/edit
  def edit
    @user = current_user
    redirect_to root_path, warning: "You don't have admin rights to visit this page" unless @user.admin?
  end

  # POST /merchants or /merchants.json
  def create
    @user = current_user
    redirect_to root_path, warning: "You don't have admin rights to visit this page" unless @user.admin?

    @merchant = Merchant.new(merchant_params)

    respond_to do |format|
      if @merchant.save
        format.html { redirect_to merchant_url(@merchant), notice: "Merchant was successfully created." }
        format.json { render :show, status: :created, location: @merchant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /merchants/1 or /merchants/1.json
  def update
    @user = current_user
    redirect_to root_path, warning: "You don't have admin rights to visit this page" unless @user.admin?

    respond_to do |format|
      if @merchant.update(merchant_params)
        format.html { redirect_to merchant_url(@merchant), notice: "Merchant was successfully updated." }
        format.json { render :show, status: :ok, location: @merchant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @merchant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /merchants/1 or /merchants/1.json
  def destroy
    @user = current_user
    redirect_to root_path, warning: "You don't have admin rights to visit this page" unless @user.admin?

    @merchant.destroy

    respond_to do |format|
      format.html { redirect_to merchants_url, notice: "Merchant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_merchant
      @merchant = Merchant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def merchant_params
      params.require(:merchant).permit(:name, :city, :street, :country_code)
    end

end
