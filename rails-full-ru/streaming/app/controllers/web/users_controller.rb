# frozen_string_literal: true

require 'csv'

class Web::UsersController < Web::ApplicationController
  # BEGIN
  include ActionController::Live
  # END

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: t('success')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find params[:id]

    if @user.update(user_params)
      redirect_to @user, notice: t('success')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find params[:id]

    @user.destroy

    redirect_to users_url, notice: t('success')
  end

  # BEGIN

  # Completed 200 OK in 30397ms (Views: 1.3ms | ActiveRecord: 703.8ms | Allocations: 23608985)
  def normal_csv
    respond_to do |format|
      format.csv do
        csv = generate_csv(User.column_names, User.all)
        send_data(csv)
      end
    end
  end

  # Completed 200 OK in 62869ms (ActiveRecord: 745.8ms | Allocations: 24802699)
  def stream_csv
    response.headers['Last-Modified'] = Time.now.httpdate.to_s
    response.headers['Content-Type'] = 'text/csv'
    response.headers["Content-Disposition"] = "attachment;filename=report.csv"

    user_column_names = User.column_names
    response.stream.write "#{user_column_names.join(',')}\n"
    # User.all.each do |user|
    User.find_each do |user|
      response.stream.write "#{user.attributes.values.join(',')}\n"
    end

  ensure
    response.stream.close
  end

  # Hexlet: Completed 200 OK in 56707ms (ActiveRecord: 865.4ms | Allocations: 20903225)
  # def stream_csv
  #   response.headers['Last-Modified'] = Time.now.httpdate.to_s
  #   send_stream(filename: 'users.csv') do |stream|
  #     stream.write 'id,name,email,created_at,updated_at\n'
  #     User.find_each do |user|
  #       stream.write "#{user.id},#{user.name},#{user.email},#{user.created_at},#{user.updated_at}\n"
  #     end
  #   end
  # end

  private

  def generate_csv(column_names, records)
    CSV.generate do |csv|
      csv << column_names # add headers to the CSV

      records.find_each do |record|
        csv << record.attributes.values_at(*column_names)
      end
    end
  end

  # END

  def user_params
    params.require(:user).permit(
      :name,
      :email
    )
  end
end
