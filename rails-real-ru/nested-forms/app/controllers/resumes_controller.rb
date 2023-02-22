# frozen_string_literal: true

class ResumesController < ApplicationController
  def index
    @resumes = Resume.all
  end

  def show
    @resume = resource_resume

    @resume_educations = @resume.educations
    @resume_works = @resume.works
  end

  def new
    @resume = Resume.new
  end

  def edit
    @resume = resource_resume
  end

  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      redirect_to @resume, notice: 'Resume was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if resource_resume.update(resume_params)
      redirect_to resource_resume, notice: 'Resume was successfully updated.'
    else
      @resume = resource_resume

      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    resource_resume.destroy

    redirect_to resumes_url, notice: 'Resume was successfully destroyed.'
  end

  private

  def resource_resume
    @resource_resume ||= Resume.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def resume_params
    params.require(:resume).permit(
      :name,
      :contact,
      :github_url,
      :summary,
      educations_attributes: %i[
        id
        institution
        faculty
        begin_date
        end_date
      ],
      works_attributes: %i[
        id
        company
        begin_date
        end_date
      ]
    )
  end
end
