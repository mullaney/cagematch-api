# class CagematchesController < ApplicationController
#   before_action :set_cagematch, only: [:show]
#   respond_to :json

#   # GET /cagematches
#   # GET /cagematches.json
#   def index
#     @cagematches = Cagematch.all
#   end

#   # GET /cagematches/1
#   # GET /cagematches/1.json
#   def show
#   end

#   # # GET /cagematches/new
#   # def new
#   #   @cagematch = Cagematch.new
#   # end

#   # # GET /cagematches/1/edit
#   # def edit
#   # end

#   # # POST /cagematches
#   # # POST /cagematches.json
#   # def create
#   #   @cagematch = Cagematch.new(cagematch_params)

#   #   respond_to do |format|
#   #     if @cagematch.save
#   #       format.html { redirect_to @cagematch, notice: 'Cagematch was successfully created.' }
#   #       format.json { render :show, status: :created, location: @cagematch }
#   #     else
#   #       format.html { render :new }
#   #       format.json { render json: @cagematch.errors, status: :unprocessable_entity }
#   #     end
#   #   end
#   # end

#   # # PATCH/PUT /cagematches/1
#   # # PATCH/PUT /cagematches/1.json
#   # def update
#   #   respond_to do |format|
#   #     if @cagematch.update(cagematch_params)
#   #       format.html { redirect_to @cagematch, notice: 'Cagematch was successfully updated.' }
#   #       format.json { render :show, status: :ok, location: @cagematch }
#   #     else
#   #       format.html { render :edit }
#   #       format.json { render json: @cagematch.errors, status: :unprocessable_entity }
#   #     end
#   #   end
#   # end

#   # # DELETE /cagematches/1
#   # # DELETE /cagematches/1.json
#   # def destroy
#   #   @cagematch.destroy
#   #   respond_to do |format|
#   #     format.html { redirect_to cagematches_url, notice: 'Cagematch was successfully destroyed.' }
#   #     format.json { head :no_content }
#   #   end
#   # end
#   private

#     # Use callbacks to share common setup or constraints between actions.
#     def set_cagematch
#       @cagematch = Cagematch.find(params[:id])
#     end

#     # Never trust parameters from the scary internet, only allow the white list through.
#     def cagematch_params
#       params.require(:cagematch).permit(:title, :slug, :description)
#     end
# end
