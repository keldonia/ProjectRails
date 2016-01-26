class ContactSharesController < ApplicationController
  def index
    contact_share = ContactShare.all
    render json: contact_share.to_json
  end

  def show
    contact_share = ContactShare.find(params[:id])
    render json: contact_share.to_json
  end

  def create
    contact_share = ContactShare.new(contact_share_params)
    if contact_share.save
      render json: contact_share
    else
      render(
          json: contact_share.errors.full_messages, status: :unprocessable_entity
        )
    end
  end

  def update
    contact_share = ContactShare.find(params[:id])
    if contact_share.update(contact_share_params)
      render json: contact_share.to_json
    else
      render(
        contact_share.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def destroy
    contact_share = ContactShare.find(params[:id])
    contact_share.destroy!
    render json: contact_share.to_json
    # redirect_to contact_shares_url
  end

  private

  def contact_share_params
    params.require(:contact_share).permit(:contact_id, :user_id)
  end
end
