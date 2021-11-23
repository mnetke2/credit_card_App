# Generate credit limit for for given 
# loan appllication
# @params[Object] Loan object
# @returns[Integer] Credit limit 
class CheckEligibility
  attr_accessor :loan_application

  def initialize(loan)
    @loan_application = loan
  end

  def call
    credit_limit
  end

  private

  def credit_limit
    maximum_possible_emi * term_in_months
  end

  def maximum_possible_emi
    ((loan_application.monthly_recurring_inflow / 2) - loan_application.monthly_recurring_outflow)
  end

  def term_in_months
    if maximum_possible_emi.between?(0, 5000)
      6
    elsif maximum_possible_emi.between?(5001, 10_000)
      12
    elsif maximum_possible_emi.between?(10_001, 20_000)
      18
    elsif maximum_possible_emi > 20_000
      24
    else
      1
    end
  end
end
