require 'net/http'
desc "Delete bad email addresses in Abonnes table"
task :check_abonne_emails => :environment do
  email_to_delete = []
  Abonne.all.each do |abonne|
    match = /@/.match(abonne.email.strip)
    email_host = match.post_match.strip
    begin
      uri = URI("http://www.#{email_host}")
      res = Net::HTTP.get_response(uri)
      unless res.code == '200' || res.code == '301' || res.code == '302' || abonne.email =~ /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
        email_to_delete << {abonne_id: abonne.id, email: abonne.email}
      end
    rescue
      email_to_delete << {abonne_id: abonne.id, email: abonne.email}
    end
  end
  email_to_delete.each do |abonne|
    puts "Destroying Abonne : #{abonne[:abonne_id]} with email #{abonne[:email]}"
    Abonne.find(abonne[:abonne_id]).destroy
  end
end