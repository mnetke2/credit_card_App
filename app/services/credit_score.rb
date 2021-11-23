# Generate CreditScore for for given User
#
# @params[Object] User object
# @returns[Integer] Credit score
class CreditScore
  def initialize(user)
    @user = user
  end

  def score
    response = full_contact_service.call
    social_profiles_count = profile_score(response[:socialProfiles])
    social_profiles_count + approved_loans_count
  end

  private

  def full_contact_service
    ::FullContactService.new(@email)
  end

  def profile_score(profiles)
    if profiles.empty?
      0
    else
      (profiles.collect { |profile| profile[:type] } & profile_data).count
    end
  end

  def profile_data
    ["linkedin", "twitter", "facebook"]
  end

  def approved_loans_count
    @user.loans.approved.count
  end
end
