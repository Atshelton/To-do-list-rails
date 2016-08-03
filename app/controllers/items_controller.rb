class ItemsController < ApplicationController

  def new
    @item = Item.new
    @list = List.find(params["list_id"])
  end

  def create
    @item = Item.new(item_params)
    @item.list_id = params["list_id"]

    if @item.save
      redirect_to list_path(id: @item.list_id)
    else
      render :new
    end
  end

  def edit
    @list = List.find(params["list_id"])
    @item = Item.find(params["id"])
  end

  def update
    @item = Item.find(params["id"])
    @list = List.find(params["list_id"])

    if @item.update(item_params)
      redirect_to list_path(@item.list_id), notice: "#{@item.task} was updated"

    else
      render :edit
    end
  end

  def destroy
    @item = Item.find(params["id"])
    @item.destroy

    redirect_to list_path(@item.list_id), notice: "#{@item.task} was successfully removed from the list"
  end


  private def item_params
    params.require("item").permit( :task )
  end
end
