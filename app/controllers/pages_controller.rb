class PagesController < ApplicationController
  # this tells rails to use the admin layout!
  layout 'admin'
  
  before_filter :confirm_logged_in, :only => [:index, :menu]
  
  def index
    list
    render('list')
  end
  
  def new
     @page = Page.new(:name => "default")
  end
  
  def create
    @page = Page.new()
    if @page.save
      flash[:notice] = "Page created"
      redirect_to(:action => 'list')
    else
      render('new')
    end    
  end
  
  def list
    @pages = Page.order("pages.position ASC")
  end
  
  def show
    @page = Page.find(params[:id])
  end
  
  def edit
    @page = Page.find(params[:id])
  end
  
  def update
   @page = Page.find(params[:id])
   if @page.update_attributes(params[:page])
     flash[:notice] = "Page updated."
     redirect_to(:action => 'show', :id => @page.id)
   else
     render('edit')
   end
  end
  
  def delete
    @page = Page.find(params[:id])
  end
  
  def destroy
    Page.find(params[:id]).destroy
    flash[:notice] = "Page Destroyed"
    redirect_to(:action => 'list')
  end      
              
end
