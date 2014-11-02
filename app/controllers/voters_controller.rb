class VotersController < ApplicationController
  before_action :set_voter, only: [:show, :edit, :update, :destroy]

  def index
    @voters = Voter.all
  end

  def show
  end

  def new
    @voter = Voter.new
  end

  def edit
  end

  def create
    @voter = Voter.new(voter_params)

    respond_to do |format|
      if @voter.save
        format.html { redirect_to @voter, notice: 'Voter was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @voter.update(voter_params)
        format.html { redirect_to @voter, notice: 'Voter was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @voter.destroy
    respond_to do |format|
      format.html { redirect_to voters_url, notice: 'Voter was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voter
      @voter = Voter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def voter_params
      params[:voter]
    end
end
