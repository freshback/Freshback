class KeshbacksController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :find_keshback, only: %i[show edit update destroy]

  def index
  @keshbacks = Keshback.all
  end

  def new
  @keshback = Keshback.new
  end

  def create
  @keshback = current_user.keshbacks.build(keshback_params)
  if @keshback.save
  redirect_to keshback_path(@keshback.id)
  else
  render 'new'
  end
  end

  def show
  end

  def edit
  end

  def update
   if @keshback.update(keshback_params)
    redirect_to keshback_path(@keshback.id)
    else render 'edit'
   end
  end

  def destroy
  if @keshback.present?
    @keshback.destroy
  end
    redirect_to root_path
   end

  private

  def find_keshback
  @keshback = Keshback.find_by(id: params[:id])
  end

  def keshback_params
  params.require(:keshback).permit(:user_id, :name, :link,:count,:description)
  end

end
