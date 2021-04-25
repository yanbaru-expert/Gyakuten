class AutoSlackApproval
  def initialize(slack_name:, slack_id:, email:)
    @slack_name = slack_name
    @slack_id = slack_id
    @email = email
  end

  def approval?
    client = Slack::Web::Client.new(token: Rails.application.credentials.dig(:slack, :oauth_token, @slack_name.to_sym))
    user = client.users_info(user: @slack_id).user
    # @email == user&.profile&.email を後で条件に追加
    !user.deleted && !user.is_bot
  rescue Slack::Web::Api::Errors::UserNotFound
    false
  end
end
