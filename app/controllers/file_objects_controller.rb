require 'test_system'

class FileObjectsController < ApplicationController
  load_and_authorize_resource except: :create

  def index
    @file_objects = @file_objects.page(params[:page]).per_page(TABLES_PER_PAGE).sort_by_creation
  end

  def show
    @file = File.open(@file_object.file.path, 'r')
  end

  def create
    file = FileObject.create(file_objects_params)
    TestSystem.new(file).check_file
    redirect_to file_objects_path
  end

  def new
  end

  def destroy
    @file_obejct.destroy
  end

  def test_again
    TestSystem.new(@file_object).check_file
    redirect_to file_objects_path(page: params[:page])
  end

  private

  def file_objects_params
    params.require(:file_object).permit(:file).merge(user: current_user)
  end
end
