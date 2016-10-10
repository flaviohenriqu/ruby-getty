class InstrutorsController < ApplicationController
  before_action :set_instrutor, only: [:show, :edit, :update, :destroy]

  # GET /instrutors
  # GET /instrutors.json
  def index
    @instrutors = Instrutor.all
  end

  # GET /instrutors/1
  # GET /instrutors/1.json
  def show
  end

  # GET /instrutors/new
  def new
    @instrutor = Instrutor.new
  end

  # GET /instrutors/1/edit
  def edit
  end

  # POST /instrutors
  # POST /instrutors.json
  def create
    @instrutor = Instrutor.new(instrutor_params)

    respond_to do |format|
      if @instrutor.save
        format.html { redirect_to @instrutor, notice: 'Instrutor was successfully created.' }
        format.json { render :show, status: :created, location: @instrutor }
      else
        format.html { render :new }
        format.json { render json: @instrutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instrutors/1
  # PATCH/PUT /instrutors/1.json
  def update
    respond_to do |format|
      if @instrutor.update(instrutor_params)
        format.html { redirect_to @instrutor, notice: 'Instrutor was successfully updated.' }
        format.json { render :show, status: :ok, location: @instrutor }
      else
        format.html { render :edit }
        format.json { render json: @instrutor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instrutors/1
  # DELETE /instrutors/1.json
  def destroy
    @instrutor.destroy
    respond_to do |format|
      format.html { redirect_to instrutors_url, notice: 'Instrutor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instrutor
      @instrutor = Instrutor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instrutor_params
      params.require(:instrutor).permit(:nome, :email, :profissao)
    end
end
