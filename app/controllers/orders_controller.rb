class OrdersController < ApplicationController

  TRANSACTION_SUCCESS_STATUSES = [
    Braintree::Transaction::Status::Authorizing,
    Braintree::Transaction::Status::Authorized,
    Braintree::Transaction::Status::Settled,
    Braintree::Transaction::Status::SettlementConfirmed,
    Braintree::Transaction::Status::SettlementPending,
    Braintree::Transaction::Status::Settling,
    Braintree::Transaction::Status::SubmittedForSettlement,
  ]

  def new
    @client_token = Braintree::ClientToken.generate
  end

  def show
    @transaction = Braintree::Transaction.find(params[:id])
    @result = _create_result_hash(@transaction)
  end

  def create
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale(
      amount: "10.00",
      payment_method_nonce: nonce
    )

    flash[:notice] = "Transaction successful! Enjoy!" if result.success?
    flash[:alert] = "Something is amiss. #{result.transaction.processor_response_text}" unless result.success?
    redirect_to order_path(result.transaction.id)
  end

  def _create_result_hash(transaction)
    status = transaction.status

    if TRANSACTION_SUCCESS_STATUSES.include? status
      result_hash = {
        :header => "Success!",
        :icon => "http://energyauditpeople.com/images/success-check-icon.png",
        :message => "Your test transaction has been successfully processed."
      }
    else
      result_hash = {
        :header => "Transaction failed",
        :icon => "fail",
        :message => "Your test transaction has a status of #{status}. Please try again."
      }
    end
  end

  def void
    result = Braintree::Transaction.void(@transaction.id)
    flash[:notice] = "Transaction voided." if result.success?
    redirect_to order_path(result.transaction.id)
  end

end
