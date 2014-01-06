class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    match = /@/.match(value)
    puts match.inspect
    email_host = match.post_match.strip if match
    valid_res_code = ['200', '301', '302']
    begin
      uri = URI("http://www.#{email_host}")
      res  = Net::HTTP.get_response(uri)
      puts "Res code : #{res.code}"
      unless valid_res_code.include?(res.code)
        # record.errors[attribute] << (options[:message] || "n'est pas une adresse email valide")
        raise
      end
    rescue
      record.errors[attribute] << (options[:message] || "n'est pas une adresse email valide")
    end
  end
end