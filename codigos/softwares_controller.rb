class SoftwaresController < ApplicationController
  before_action :set_software, only: [:show, :edit, :update, :destroy]

  def index
    @softwares = Software.all
    @technical_skills = TechnicalSkill.all
    @soft_skills = SoftSkill.all
    @resources = Resource.all
    @communication_channels = CommunicationChannel.all
  end
 
  
  def show
    @technical_skills = TechnicalSkill.all
    @soft_skills = SoftSkill.all
    @resources = Resource.all
    @communication_channels = CommunicationChannel.all
  end

  def new
    @software = Software.new
  end

  def edit
  end

  def create
    @software = Software.new(software_params)

    respond_to do |format|
      if @software.save
        format.html { redirect_to @software, notice: 
	'Software was successfully created.' }
        format.json { render :show, status: :created, 
	location: @software }
      else
        format.html { render :new }
        format.json { render json: @software.errors, status: 
	:unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @software.update(software_params)
        format.html { redirect_to @software, notice: 
	'Software was successfully updated.' }
        format.json { render :show, status: :ok, location: @software }
      else
        format.html { render :edit }
        format.json { render json: @software.errors, status: 
	:unprocessable_entity }
      end
    end
  end

  def destroy
    @software.destroy
    respond_to do |format|
      format.html { redirect_to softwares_url, notice: 
	'Software was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_software
      @software = Software.find(params[:id])
    end

    def software_params
      params.require(:software).permit(:name, :description, :page, 
	:contribution_model, :coding_standard, :contribution_standard, 
	:setup_workspace, :issue_tracker, :repository, 
	:communication_channels)
    end
end
