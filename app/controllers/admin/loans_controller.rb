class Admin::LoansController < Admin::AdminController
  def index
    @loans = Loan.includes(:user)
  end

  def approve
    loan = Loan.find_by_id(params['id'])
    loan.approved = !loan.approved
    loan.save!
  end
end
