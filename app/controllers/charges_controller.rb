class ChargesController < ApplicationController
  before_action :amount_to_be_charged, :authenticate_user!
  def new
  end

  def create

    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: params[:amount],
                                      description: @description)

    redirect_to thanks_path(:charge => charge.id)
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  def thanks
    # render json: params[:charge]
    @receipt = Stripe::Charge.retrieve(params[:charge])
    #code
    # if Stripe::Charge.list().data.first.source.name == current_user.email
    #   @receipt = Stripe::Charge.list().data.first
    # end
    # # @receipt = Stripe::Charge.retrieve(@@charge_id)
    # render json: @receipt
    # can get
  end

  def description
    @description = "Some amazing product"
  end

  def amount_to_be_charged
    @amount = params[:amount]
  end

end
