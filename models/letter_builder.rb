class LetterBuilder
  attr_accessor :representative, :content, :writer_name, :writer_address,:writer_phone, :writer_email

  def initialize(representative)
    @representative = representative
  end

  def bioguide_id
    @representative['bioguide_id']
  end


  def to_address
    "<p>The Honorable #{representative['first_name']} #{representative['last_name']}</p>
     <p>#{representative['office']}</p>
     <p>Washington, DC 20510</p>
    "
  end

  def from
    @from = "#{@writer_name}
            #{@writer_address}
            #{@writer_phone}
            #{@writer_email}"
  end

  def salutation
    if @representative["title"] == "sen"
      "Dear Senator #{representative['last_name']},"
    elsif @representative["title"] == "rep" && @representative["gender"] == "F"
      "Dear Congresswoman #{representative['last_name']},"
    else
      "Dear Congressman #{representative['last_name']},"
    end    
  end


end