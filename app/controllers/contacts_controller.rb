class ContactsController < ApplicationController

  respond_to :html

  def index
    redirect_to new_contact_path
  end
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
			if @contact.save
        redirect_to root_path, notice: 'Спасибо за обращение, скоро мы с вами свяжемся.'
      else
        render :new
			end
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :message )
    end
end
