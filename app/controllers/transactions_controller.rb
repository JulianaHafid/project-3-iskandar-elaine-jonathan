class TransactionsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :show]

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
    # @transaction = Transaction.new
    # @transaction.request_id=params[:request_id]
    # @transaction.amount_paid = params[:amount_paid]
  end

  def show
    @braintree_transaction = Braintree::Transaction.find(params[:id])
    @result = _create_result_hash(@braintree_transaction)
  end

  def create
    @transaction = Transaction.new
    @transaction.request_id = params[:request_id]
    @transaction.amount_paid = params[:amount_paid]
    nonce = params[:payment_method_nonce]
    render action: :new and return unless nonce
    result = Braintree::Transaction.sale(
      amount: @transaction.amount_paid.to_s,
      payment_method_nonce: nonce
    )

    flash[:notice] = "Transaction successful! Enjoy!" if result.success?
    flash[:alert] = "Something is amiss. #{result.transaction.processor_response_text}" unless result.success?
    redirect_to transaction_path(result.transaction.id)
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
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_transaction
    @transaction = Transaction.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def transaction_params
    params.require(:transaction).permit(:request_id, :amount_paid)
  end

end
