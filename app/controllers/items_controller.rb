class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @item = Items.all.order("created_at DESC")
  end  
  
  def edit
  end  

  
end
