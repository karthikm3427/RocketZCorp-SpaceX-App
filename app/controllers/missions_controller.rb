class MissionsController < ApplicationController
  before_action :set_mission, only: [:show, :edit, :update, :destroy]

  # GET /missions
  # GET /missions.json
  def index
    @missions = Mission.all.order("created_at DESC").limit(3)
  end

  def missionlist
    @allmissions = Mission.count
    @num_pages = @allmissions/8.0
    @mod_pages = @num_pages % 1.0
    @mod_pages = 1.0 - @mod_pages
    if @mod_pages != 0
      @num_pages = @num_pages + @mod_pages
      else
        @num_pages = @num_pages
      end
    @page = params['page'].to_i #integer => no.of page
    @next_page = @page + 1 unless Mission.count < 8
    @prev_page = @page - 1 unless @page == 0
    @missions = Mission.all.order("created_at DESC").limit(8).offset(@page*8)
  end

  # GET /missions/1
  # GET /missions/1.json
  def show
  end

  def search
    if params[:search].blank?
     @missions = Mission.all.order("created_at DESC").limit(20)
     else
      @missions = Mission.search(params)
     end
  end

  # GET /missions/new
  def new
    @mission = Mission.new
  end

  # GET /missions/1/edit
  def edit
  end

  # POST /missions
  # POST /missions.json
  def create
    @mission = Mission.new(mission_params)

    respond_to do |format|
      if @mission.save
        format.html { redirect_to @mission, notice: 'Mission was successfully created.' }
        format.json { render :show, status: :created, location: @mission }
      else
        format.html { render :new }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /missions/1
  # PATCH/PUT /missions/1.json
  def update
    respond_to do |format|
      if @mission.update(mission_params)
        format.html { redirect_to @mission, notice: 'Mission was successfully updated.' }
        format.json { render :show, status: :ok, location: @mission }
      else
        format.html { render :edit }
        format.json { render json: @mission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /missions/1
  # DELETE /missions/1.json
  def destroy
    @mission.destroy
    respond_to do |format|
      format.html { redirect_to missions_url, notice: 'Mission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mission
      @mission = Mission.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mission_params
      params.require(:mission).permit(:title, :subtitle, :boxtitle, :boxinfo, :banner, :picone, :pictwo, :video, :audio)
    end
end
