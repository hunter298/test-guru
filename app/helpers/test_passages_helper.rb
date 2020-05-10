module TestPassagesHelper

  def earned_badges(test_passage)
    Badge.all.select { |badge| badge.check_condition(test_passage) }
  end

end
