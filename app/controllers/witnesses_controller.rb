class WitnessesController < ApplicationController
  before_action :set_witness, only: [:show, :edit, :update, :destroy]

  # GET /witnesses
  # GET /witnesses.json
  # def index
  #   @witnesses = Witness.all
  # end

  # GET /witnesses/1
  # GET /witnesses/1.json
  # def show
  # end

  # GET /witnesses/new
  def new
    @witness = Witness.new
  end

  # GET /witnesses/1/edit
  # def edit
  # end

  # POST /witnesses
  # POST /witnesses.json
  def create
    @witness = Witness.new(witness_params)

    respond_to do |format|
      if @witness.save
        WitnessMailer.new_witness(@witness).deliver_later
        format.html { redirect_to root_path, notice: 'Witness was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /witnesses/1
  # PATCH/PUT /witnesses/1.json
  # def update
  #   respond_to do |format|
  #     if @witness.update(witness_params)
  #       format.html { redirect_to @witness, notice: 'Witness was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @witness }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @witness.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /witnesses/1
  # DELETE /witnesses/1.json
  # def destroy
  #   @witness.destroy
  #   respond_to do |format|
  #     format.html { redirect_to witnesses_url, notice: 'Witness was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  def get_municipality
    @municipalities = Department.find(params[:department_id]).municipalities
  end

  def get_zone
    @zones = Municipality.find(params[:municipality_id]).zones
  end

  def get_post
    @posts = Zone.find(params[:zone_id]).posts
  end

  def get_table
    @tables = Post.find(params[:post_id]).tables
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_witness
      @witness = Witness.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def witness_params
      params.require(:witness).permit(:doc_number, :first_name, :second_name, :surname, :second_surname, :has_smartphone, :phone, :email, :foreing, :department_id, :municipality_id, :outside_witness, :zone_id, :post_id, :table)
    end
end
