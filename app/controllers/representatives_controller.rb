class RepresentativesController < ApplicationController
  before_action :set_representative, only: [:show, :edit, :update, :destroy]

  def index
    @representatives = Representative.all
  end

  def show
  end

  def new
    @representative = Representative.new
  end

  def edit
  end

  def create
    @representative = Representative.new(representative_params)

    respond_to do |format|
      if @representative.save
        format.html { redirect_to @representative, notice: 'Representative was successfully created.' }
        format.json { render :show, status: :created, location: @representative }
      else
        format.html { render :new }
        format.json { render json: @representative.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @representative.update(representative_params)
        format.html { redirect_to @representative, notice: 'Representative was successfully updated.' }
        format.json { render :show, status: :ok, location: @representative }
      else
        format.html { render :edit }
        format.json { render json: @representative.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @representative.destroy
    respond_to do |format|
      format.html { redirect_to representatives_url, notice: 'Representative was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_representative
      @representative = Representative.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def representative_params
      params.require(:representative).permit(:headshot)
    end
end
