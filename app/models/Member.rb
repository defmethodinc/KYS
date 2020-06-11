class Member < ApplicationRecord
  has_many :experiences
  has_one :profile
  has_many :confidence_levels

  def self.get_members(conditions)
    or_clause , or_result ,and_result, and_clause = [],[],[],[]
    count_and = 0
    select_clause = "members.name as member ,tools.name as tool,
    confidence_levels.confidence_level as level"

    conditions.each do |condition|
      if condition.is_a?(Array)
        sub_and = []
        condition.each do |cond|
          sub_and << "(tools.id in (#{remove_brackets(cond[:tool_id])})
                       and confidence_levels.confidence_level
                       between #{cond[:level][0]} and #{cond[:level][1]}) "
          count_and += 1
        end
        and_clause << "(#{sub_and.join(" OR ")})"
      else
        or_clause << "(tools.id in (#{remove_brackets(condition[:tool_id])})
                       and confidence_levels.confidence_level
                       between #{condition[:level][0]} and #{condition[:level][1]})"
      end
    end

    or_result = Member
      .joins(confidence_levels: :tool)
      .select(select_clause)
      .where(or_clause.join(" OR "))
      .order(tool: :asc, level: :desc)

    unless and_clause.empty?
      members = Member
                  .joins(confidence_levels: :tool)
                  .where(and_clause.join(" OR "))
                  .group(:id).having('COUNT("members"."id")=' + count_and.to_s )

      and_result = Member
        .joins(confidence_levels: :tool)
        .select(select_clause)
        .where(and_clause.join(" OR ") + " and members.id in (#{remove_brackets(members.pluck(:id ))})")
        .order(tool: :asc, level: :desc) unless members.empty?
    end
    (or_result + and_result).map { |a| [a.member, a.tool, a.level] }
    end

  private

  def self.remove_brackets(str_value)
    str_value.to_s.gsub("[", "").gsub("]", "")
  end
end


