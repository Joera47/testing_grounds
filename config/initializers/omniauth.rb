Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '195774145285-fccdba33jc13c56tgmp92d886ch21373.apps.googleusercontent.com', 'EiWOK4mL33Mc962Ua0qkf19g', scope: 'userinfo.profile,youtube'
end