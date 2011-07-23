class SubjectsController < ApplicationController
  
  layout 'admin'
  
  def index
    list
    render('list')
  end  
  
  def list
    @subjects = Subject.order("subjects.position ASC")
  end  
  
  def show
    @subject = Subject.find(params[:id])
  end  
  
  def new
    @subject = Subject.new(:name => "default")
  end  
  
  def create
    @subject = Subject.new(params[:subject])
    if @subject.save
      flash[:notice] = "Subject created."
      redirect_to(:action => 'list')
    else
      render('new')
    end  
  end  
  
  def edit
    @subject = Subject.find(params[:id])
  end  
  
  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      flash[:notice] = "Subject updated."
      redirect_to(:action => 'show', :id => @subject.id)
    else
      render('edit')
    end
  end  
  
  def delete
    @subject = Subject.find(params[:id])
  end  
  
  def destroy
    Subject.find(params[:id]).destroy
    flash[:notice] = "Subject destoyed."
    redirect_to(:action => 'list')
  end  
  
end
