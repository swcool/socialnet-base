Rails.application.config.middleware.use OmniAuth::Builder do
    # ALWAYS RESTART YOUR SERVER IF YOU MAKE CHANGES TO THESE SETTINGS!
     
    # you need a store for OpenID; (if you deploy on heroku you need Filesystem.new('./tmp') instead of Filesystem.new('/tmp'))
    require 'openid/store/filesystem'
    
    # load certificates
    require "openid/fetchers"
    OpenID.fetcher.ca_file = "#{Rails.root}/config/ca-bundle.crt"
     
    # providers with id/secret, you need to sign up for their services (see below) and enter the parameters here  
    provider :facebook, '171174192945589', '7adf9c708b4f80aee1de6a9211c68e68'
    provider :twitter, 'UUVVbEaBjm0GrRkG8Mesg', 'Qxi86s8op34KQDokQMOWvjYVJmvP72JDLXur91iiI'
    provider :github, '82e688018a15aff0c002', '38cfe0c37a1fbd4c30c02726fcd57fa0dab68c5f'
    provider :tsina, '92783654', 'b8e8af30acaec274d67b119030d9e881'

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