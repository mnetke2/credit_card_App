class LoansController < ApplicationController
  def index
    @loans = current_user.loans
  end

  def new
    @loan = Loan.new
  end

  def create
    @loan = current_user.loans.new(loan_params)

    @loan.credit_score = ::CreditScore.new(current_user).score
    @loan.credit_limit = ::CheckEligibility.new(@loan).call

    respond_to do |format|
      if @loan.save!
        format.html { redirect_to loans_path, notice: 'Credit card appllication submitted successfully' }
        format.json { render :show, status: :created, location: @loan }
      else
        format.html { render :new }
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def loan_params
    params.require(:loan).permit(:email, :pan_card, :aadhar_number, :bank_account_number, :bank_ifsc,
                                 :monthly_recurring_inflow, :monthly_recurring_outflow)
  end
end
