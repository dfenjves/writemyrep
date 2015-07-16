class LetterBuilder
  attr_reader :representative, :from

  def initialize(bioguide_id)
    @representative = LegislatorFinder.new.search_by_bioguide_id(bioguide_id)
  end

  def to_address
    "The Honorable #{representative['first_name']} #{representative['last_name']}
     #{representative['office']}
     Washington, DC 20510
    "
  end

  def from=(user_name, user_address, user_phone, user_email)
    @from = "#{user_name}
            #{user_address}
            #{user_phone}
              #{user_email}"
  end

  def salutation
    if @representative["title"] == "Sen"
      "Dear Senator #{representative['last_name']}"
    elsif @representative["title"] == "Rep" && @representative["gender"] == "F"
      "Dear Congresswoman #{representative['last_name']}"
    else
      "Dear Congressman #{representative['last_name']}"
    end    
  end

  def content(support_or_opposition, issue, who_am_i, affected_parties, primary_concern, details, outcome)
    "I write to you as a constituent expressing my #{support_or_opposition} the upcoming legislation addressing #{issue}. This issue is of paramount interest to me because I am #{who_am_i}. This issue directly impacts #{affected_parties}.

    I am primarily concerned about #{primary_concern} because #{details}.

    Thank you for your consideration of my viewpoint on this matter. I believe it is an important issue, and would like to see the legislation #{outcome}.

    Sincerely,
    "
  end

end