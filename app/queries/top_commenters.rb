class TopCommenters
  attr_accessor :scope

  def initialize(scope)
    @scope = scope
  end

  def call(days_ago: 7, limit: 10)
    scope.joins(:comments)
      .select("users.*, COUNT(comments.user_id) as total_comments")
      .order("total_comments DESC")
      .group("comments.user_id")
      .where("comments.created_at > ?", Time.zone.now - days_ago.days)
      .limit(limit)
  end
end
