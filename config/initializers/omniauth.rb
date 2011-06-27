Rails.application.config.middleware.use OmniAuth::Builder do
    # ALWAYS RESTART YOUR SERVER IF YOU MAKE CHANGES TO THESE SETTINGS!
     
    # you need a store for OpenID; (if you deploy on heroku you need Filesystem.new('./tmp') instead of Filesystem.new('/tmp'))
    require 'openid/store/filesystem'
    
    # load certificates
    require "openid/fetchers"
    OpenID.fetcher.ca_file = "#{Rails.root}/config/ca-bundle.crt"
     
    # providers with id/secret, you need to sign up for their services (see below) and enter the parameters here  
      provider :open_id, OpenID::Store::Filesystem.new('/tmp')
      provider :facebook, '140124176062694', '3a58f182a8e0115df8814a1c63583960',
               { :client_options => {
                   :ssl => {
                     :ca_file => './config/ca-bundle.crt'
                   }
                 }
               }
        
      provider :twitter, 'UUVVbEaBjm0GrRkG8Mesg', 'Qxi86s8op34KQDokQMOWvjYVJmvP72JDLXur91iiI'
      provider :github, '82e688018a15aff0c002', '38cfe0c37a1fbd4c30c02726fcd57fa0dab68c5f',
                  { :client_options => {
                      :ssl => { :verify => false } 
                     }
                   }
      provider :tsina, '92783654', 'b8e8af30acaec274d67b119030d9e881'

      # localhost
     # provider :facebook, '128046153937514', '0155817c7795a785b328f8e77dd7398f'
     # provider :twitter, 'K21nI9NJxx1jYeDyr7uKfg', 'zfaTeV1fj0PnEGAE5pkRY7hpsDlKNtXHtTw4tODwQw'
     # provider :github, '02d9ecc4da0da3b7cb98', 'f08ff4a3e711db3933ebff7177416de38248a9a8'
     # provider :tsina, '1798569376', 'a799fc77dd75538abcc529fa6fadf90e'

    # generic openid
    provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'openid'
        
    # dedicated openid
    provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
    # provider :google_apps, OpenID::Store::Filesystem.new('./tmp'), :name => 'google_apps'
    # /auth/google_apps; you can bypass the prompt for the domain with /auth/google_apps?domain=somedomain.com
        
    provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'yahoo', :identifier => 'yahoo.com' 
    provider :openid, OpenID::Store::Filesystem.new('/tmp'), :name => 'aol', :identifier => 'openid.aol.com'
    provider :openid, OpenID::Store::Filesystem.new('./tmp'), :name => 'myopenid', :identifier => 'myopenid.com'
        
    # Sign-up urls for Facebook, Twitter, Github, and Weibo
    # https://developers.facebook.com/setup
    # https://github.com/account/applications/new
    # https://developer.twitter.com/apps/new
    # http://open.weibo.com/apps/new
  end