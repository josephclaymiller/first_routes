class ContactsController < ApplicationController
  def index
    contacts = Contact.all
    render :json => contacts
  end

  def create
    contact = Contact.new(params[:contact])
    if contact.save
      render :json => contact
    else
      render :json => contact.errors, :status => :unprocessable_entity
    end
  end

  def show
    contact = Contact.find(params[:id])
    render :json => contact
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update_attributes(params[:user])
      render :json => contact
    else
      render :json => contact.errors, :status => :unprocessable_entity
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    head :ok
  end
end
