class ChargesController < ApplicationController
  before_action :amount_to_be_charged, :authenticate_user!
  def new
  end

  def create
    return redirect_to edit_user_registration_path if /a-zA-Z/.match(params[:amount])

    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: (params[:amount].to_f*100).to_i,
                                      description: @description)


# Update database if transaction is unique and successful
    @new_charge_id = charge.id
    if !(Transaction.find_by(charge_id: "#{@new_charge_id}"))
      @receipt = Stripe::Charge.retrieve(charge.id)
      @user_balance = current_user.balance.to_f
      @user_balance = @user_balance + (@receipt.amount/100)
      current_user.balance = @user_balance
      current_user.save
      @new_transaction = Transaction.new(
        user_id: current_user.id,
        charge_id: @new_charge_id
      )
      @new_transaction.save
    end
    redirect_to edit_user_registration_path
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to edit_user_registration_path
  end

  def thanks
    # render json: params[:charge]
    @new_charge_id = params[:charge]

    if !(Transaction.find_by(charge_id: "#{@new_charge_id}"))
      @receipt = Stripe::Charge.retrieve(params[:charge])
      @user_balance = current_user.balance.to_f
      @user_balance = @user_balance + (@receipt.amount/100)
      current_user.balance = @user_balance
      current_user.save
      @new_transaction = Transaction.new(
        user_id: current_user.id,
        charge_id: @new_charge_id
      )
      @new_transaction.save
    end
    redirect_to edit_user_registration_path

    #code
    # if Stripe::Charge.list().data.first.source.name == current_user.email
    #   @receipt = Stripe::Charge.list().data.first
    # end
    # # @receipt = Stripe::Charge.retrieve(@@charge_id)
    # render json: @receipt
    # can get
  end

  private

  def description
    @description = "Purchase of E-Credit"
  end

  def amount_to_be_charged
    @amount = params[:amount]
  end

  def deposit_params
    params.require(:charge).permit(:user)
  end
end
