task :refresh => :environment do
    puts "/////////////Current Token/////////////"
    p Token.first
    puts
    puts "Refreshing Access Token"
    Token.first.refresh!
    puts
    puts "/////////////New Token/////////////"
    p Token.first
    puts "Done"
end