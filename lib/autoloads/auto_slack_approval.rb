class AutoSlackApproval
  def initialize(resource)
    @slack_name = resource.slack_name
    @slack_id = resource.slack_id
    @email = resource.email
  end

  def approval?
    client = Slack::Web::Client.new(token: Rails.application.credentials.dig(:slack, :oauth_token, @slack_name.to_sym))
    user = client.users_info(user: @slack_id).user

    exist_email?(user) && !user.deleted && !user.is_bot
  rescue Slack::Web::Api::Errors::UserNotFound
    false
  end

  private

  def exist_email?(user)
    email = user&.profile&.email
    email.nil? ? true : @email == user&.profile&.email
  end
end
