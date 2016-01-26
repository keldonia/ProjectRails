class ContactsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    contacts = user.contacts + user.shared_contacts
    render json: contacts.to_json
  end

  def show
    contact = Contact.find(params[:id])
    render json: contact.to_json
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render(
          json: contact.errors.full_messages, status: :unprocessable_entity
        )
    end
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update(contact_params)
      render json: contact.to_json
    else
      render(
        contact.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy!
    render json: contact.to_json
    # redirect_to contacts_url
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :user_id)
  end

end
