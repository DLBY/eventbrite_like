class ChargesController < ApplicationController
  def new
  end

  def create
    
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Inscription',
      currency: 'EUR',
    })
  

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path

    private
    def get_current_event
      @event = Event.find(params[:event_id])
    end
  
    def get_price
      @amount = @event.price*100
    end

  end
  

end
