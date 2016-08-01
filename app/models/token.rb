class Token < ActiveRecord::Base
    validates :token, :refresh_token, :expires_at, presence: true

    def refresh!
        refresh_token! if expires_at < Time.now
    end

    private

    def refresh_token!
        response = HTTParty.post("https://accounts.google.com/o/oauth2/token",
            body: {
                grant_type: "refresh_token",
                client_id: "195774145285-fccdba33jc13c56tgmp92d886ch21373.apps.googleusercontent.com",
                client_secret: "EiWOK4mL33Mc962Ua0qkf19g",
                refresh_token: refresh_token
                },
            headers: {"Content-Type" => "application/x-www-form-urlencoded"})
        binding.pry
        response = JSON.parse(response.body)
        update_attributes(
            token: response["access_token"],
            expires_at: Time.now + response["expires_in"].to_i.seconds
            )
    end
end
