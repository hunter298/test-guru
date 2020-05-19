module BadgesHelper
  def rules_lib
    BadgeService::RULES.map do |rule|
      [rule, t("rules.#{rule}")]
    end
  end
end
