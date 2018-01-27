class ChargesController < ApplicationController
  before_action :amount_to_be_charged
  before_action :authenticate_user!
  before_action :description
  def new

  end

  def create
<<<<<<< HEAD
      # @amount = params[:amount]
      # @amount = @amount.gsub('$', '').gsub(',', '')
      #
      # begin
      #   @amount = Float(@amount).round(2)
      #   p @amount
      # rescue
      #   flash[:error] = 'Charge not completed. Please enter a valid amount in SGD$.'
      #   redirect_to root_path
      #   return
      # end
      #
      # @amount = (@amount * 100).to_i
      # if @amount < 100
      #   flash[:error] = 'Charge not completed. Amount entered must be greater than $1.'
      #   redirect_to root_path
      #   return
      # end

      # customer = Stripe::Customer.create(
      #   :email => params[:stripeEmail],
      #   :source => params[:stripeToken]
      # )

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
      redirect_to root_path

      rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to edit_user_registration_path



    # customer = StripeTool.create_customer(email: params[:stripeEmail],
    #                                       stripe_token: params[:stripeToken])
    #
    # charge = StripeTool.create_charge(customer_id: customer.id,
    #                                   amount: (params[:amount].to_f*100).to_i,
    #                                   description: @description)



    # redirect_to edit_user_registration_path
    # rescue Stripe::CardError => e
    # flash[:error] = e.message
    # redirect_to edit_user_registration_path
=======

    customer = StripeTool.create_customer(email: params[:stripeEmail],
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id,
                                      amount: params[:amount],
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
    redirect_to root_path
    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
>>>>>>> master
  end

  def thanks
    # render json: params[:charge]
<<<<<<< HEAD

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
    # redirect_to edit_user_registration_path
=======
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
    redirect_to root_path
>>>>>>> master

    #code
    # if Stripe::Charge.list().data.first.source.name == current_user.email
    #   @receipt = Stripe::Charge.list().data.first
    # end
    # # @receipt = Stripe::Charge.retrieve(@@charge_id)
    # render json: @receipt
    # can get
  end

<<<<<<< HEAD
  private
=======
  def description
    @description = "Some amazing product"
  end
>>>>>>> master

  def amount_to_be_charged
    @amount = (params[:amount].to_f*100).to_i
  end

  def description
    @description = 'E-Credit Purchase on Cash My Bling'
  end

end
