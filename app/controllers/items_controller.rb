class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy ]

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
    if params[:transaction_type] == "income"
      @item.transaction_type = TransactionType.find_by(name: "Prihod")
    elsif params[:transaction_type] == "expense"
      @item.transaction_type = TransactionType.find_by(name: "Rashod")
    elsif params[:transaction_type] == "transfer"
      @item.transaction_type = TransactionType.find_by(name: "Prijenos")
    else
      @item.errors
    end
    @item.event_date = Time.now.strftime('%Y.%m.%d. %I:%M:%S %p')
    @item.payment_date = Time.now.strftime('%Y.%m.%d. %I:%M:%S %p')
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to items_url, notice: "Item was successfully created." }
        format.json { render :index, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy!

    respond_to do |format|
      format.html { redirect_to items_path, status: :see_other, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params
        .require(:item)
        .permit(
          :payment_type_id,
          :transaction_type_id,
          :category_id,
          :note,
          :amount,
          :event_date,
          :payment_date
        )
    end
end
