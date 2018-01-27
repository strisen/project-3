class ChargesController < ApplicationController
  before_action :amount_to_be_charged, :authenticate_user!
  def new
  end

  def create

    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: @amount,
                                      description: "E-Credit")


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
    redirect_to new_charge_path
  end

  def thanks
    # render json: params[:charge]
    # @new_charge_id = params[:charge]
    #
    # if !(Transaction.find_by(charge_id: "#{@new_charge_id}"))
    #   @receipt = Stripe::Charge.retrieve(params[:charge])
    #   @user_balance = current_user.balance.to_f
    #   @user_balance = @user_balance + (@receipt.amount/100)
    #   current_user.balance = @user_balance
    #   current_user.save
    #   @new_transaction = Transaction.new(
    #     user_id: current_user.id,
    #     charge_id: @new_charge_id
    #   )
    #   @new_transaction.save
    # end
    # redirect_to root_path

    #code
    # if Stripe::Charge.list().data.first.source.name == current_user.email
    #   @receipt = Stripe::Charge.list().data.first
    # end
    # # @receipt = Stripe::Charge.retrieve(@@charge_id)
    # render json: @receipt
    # can get
  end

  # def description
  #   @description = "Some amazing product"
  # end
  #
  def amount_to_be_charged
    @amount = params[:amount]
    @amount = @amount.gsub('$','').gsub(',', '')
    begin
      @amount = Float(@amount).round(2)
    rescue
      flash[:error] = 'Error in Amount'
    end

    @amount = params[:amount].to_f*100
    @amount = @amount.to_i
  end
  #
  # def deposit_params
  #   params.require(:charge).permit(:user)
  # end
end
