class FileObjectsController < ApplicationController
  load_and_authorize_resource except: :create

  def index
  end

  def show
    @file = File.open(@file_object.file.path, 'r')
  end

  def create
    FileObject.create(file_objects_params)
    redirect_to file_objects_path
  end

  def new
  end

  def destroy
    @file_obejct.destroy
  end

  private

  def file_objects_params
    params.require(:file_object).permit(:file).merge(user: current_user)
  end
end
