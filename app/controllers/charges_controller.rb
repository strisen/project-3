class ChargesController < ApplicationController
  before_action :amount_to_be_charged
  before_action :authenticate_user!
  before_action :description

  def new

  end

  def create

    charge = Stripe::Charge.create(
      :amount => @amount,
      :currency => 'sgd',
      :source => params[:stripeToken],
      :description => @description
    )
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

    # Notify user of successful transaction
    flash[:notice] = "Successfully Bought $#{@amount/100} in E-Credits!"
    redirect_to edit_user_registration_path

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to edit_user_registration_path

  end

  private

  def amount_to_be_charged
    @amount = (params[:amount].to_f*100).to_i
  end

  def description
    # For Transaction records on Stripe
    @description = 'E-Credit Purchase on Cash My Bling'
  end

end
