class SectionsController < ApplicationController
  layout 'admin'
  
  def index
    list
    render('list')
  end
  
  def new
     @section = Section.new(:name => "default")
  end
  
  def create
    @page = @Page.new
    if @page.save
      flash[:notice] = "Section created"
      redirect_to(:action => 'list')
    else
      render('new')  
  end
  
  def list
    @sections = Section.order("sections.position ASC")
  end
  
  def show
    @section = Section.find(params[:id])
  end
  
  def edit
    @section = Section.find(params[:id])
  end
  
  def update
    @section = Section.find(params[:id])
    if @section.save
      flash[:notice] = "Section updated"
      redirect_to(:action => 'show' :id => @section.id)
    else
      render('edit')
    end  
  end
  
  def delete
    @section = Section.find(params[:id])
  end
  
  def destroy
    Section.find(params[:id]).destroy
    flash[:notice] = "Section destroyed"
    redirect_to(:action => 'list')
  end
  
end
