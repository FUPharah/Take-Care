class FamiliesController < ApplicationController
  before_action :set_user, only: %i[index show new create edit update destroy]
  before_action :set_family, only: %i[show edit update destroy]

  def index
    @families = Family.all
  end

  def show
  end

  def new
    @family = Family.new
  end

  def create
    @family = Family.new(family_params)
    @family.user = current_user
    if @family.save
      redirect_to families_path(@family)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @family.update(family_params)
    redirect_to family_path(@family)
  end

  def destroy
    @family.destroy
    redirect_to families_path
  end

  private

  def family_params
    params.require(:family).permit(:first_name, :last_name, :age, :avatar)
  end

  def set_user
    @user = current_user
  end

  def set_family
    @family = Family.find(params[:id])
  end
end
