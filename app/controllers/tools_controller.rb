class ToolsController < ApplicationController
  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create
    tool = Tool.new(tool_params)
    if tool.save
      redirect_to tools_path
    else
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
    if tool.save
      redirect_to tools_path
    else
      render :edit
    end
  end

  def update

  end

  def show
    @tool = Tool.find(params[:id])
  end

  def destroy
    Tool.find(params[:id]).destroy
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :quantity, :price)
  end
end
