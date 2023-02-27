# DMM WEBCAMPコンテンツ課題

## 就業両立コース(クラウド必須)_応用知識学習フェーズver1.3 実装

### rubyバージョン
- ruby 3.1.2p20 (2022-04-12 revision 4491bb740a) [x86_64-linux]

### railsバージョン
- Rails 6.1.7.2

### Gemfile (bundle install)
- devise
- pry-rails
- enum_help

### routes
                                  Prefix Verb   URI Pattern                                                                                       Controller#Action
                                    root GET    /                                                                                                 public/homes#top
                                   about GET    /about(.:format)                                                                                  public/homes#about
                    new_customer_session GET    /customers/sign_in(.:format)                                                                      public/sessions#new
                        customer_session POST   /customers/sign_in(.:format)                                                                      public/sessions#create
                destroy_customer_session DELETE /customers/sign_out(.:format)                                                                     public/sessions#destroy
            cancel_customer_registration GET    /customers/cancel(.:format)                                                                       public/registrations#cancel
               new_customer_registration GET    /customers/sign_up(.:format)                                                                      public/registrations#new
              edit_customer_registration GET    /customers/edit(.:format)                                                                         public/registrations#edit
                   customer_registration PATCH  /customers(.:format)                                                                              public/registrations#update
                                         PUT    /customers(.:format)                                                                              public/registrations#update
                                         DELETE /customers(.:format)                                                                              public/registrations#destroy
                                         POST   /customers(.:format)                                                                              public/registrations#create
                       new_admin_session GET    /admin/sign_in(.:format)                                                                          admin/sessions#new
                           admin_session POST   /admin/sign_in(.:format)                                                                          admin/sessions#create
                   destroy_admin_session DELETE /admin/sign_out(.:format)                                                                         admin/sessions#destroy
                          admin_home_top GET    /admin(.:format)                                                                                  admin/homes#top
           rails_postmark_inbound_emails POST   /rails/action_mailbox/postmark/inbound_emails(.:format)                                           action_mailbox/ingresses/postmark/inbound_emails#create
              rails_relay_inbound_emails POST   /rails/action_mailbox/relay/inbound_emails(.:format)                                              action_mailbox/ingresses/relay/inbound_emails#create
           rails_sendgrid_inbound_emails POST   /rails/action_mailbox/sendgrid/inbound_emails(.:format)                                           action_mailbox/ingresses/sendgrid/inbound_emails#create
     rails_mandrill_inbound_health_check GET    /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#health_check
           rails_mandrill_inbound_emails POST   /rails/action_mailbox/mandrill/inbound_emails(.:format)                                           action_mailbox/ingresses/mandrill/inbound_emails#create
            rails_mailgun_inbound_emails POST   /rails/action_mailbox/mailgun/inbound_emails/mime(.:format)                                       action_mailbox/ingresses/mailgun/inbound_emails#create
          rails_conductor_inbound_emails GET    /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#index
                                         POST   /rails/conductor/action_mailbox/inbound_emails(.:format)                                          rails/conductor/action_mailbox/inbound_emails#create
       new_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/new(.:format)                                      rails/conductor/action_mailbox/inbound_emails#new
      edit_rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id/edit(.:format)                                 rails/conductor/action_mailbox/inbound_emails#edit
           rails_conductor_inbound_email GET    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#show
                                         PATCH  /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
                                         PUT    /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#update
                                         DELETE /rails/conductor/action_mailbox/inbound_emails/:id(.:format)                                      rails/conductor/action_mailbox/inbound_emails#destroy
new_rails_conductor_inbound_email_source GET    /rails/conductor/action_mailbox/inbound_emails/sources/new(.:format)                              rails/conductor/action_mailbox/inbound_emails/sources#new
   rails_conductor_inbound_email_sources POST   /rails/conductor/action_mailbox/inbound_emails/sources(.:format)                                  rails/conductor/action_mailbox/inbound_emails/sources#create
   rails_conductor_inbound_email_reroute POST   /rails/conductor/action_mailbox/:inbound_email_id/reroute(.:format)                               rails/conductor/action_mailbox/reroutes#create
                      rails_service_blob GET    /rails/active_storage/blobs/redirect/:signed_id/*filename(.:format)                               active_storage/blobs/redirect#show
                rails_service_blob_proxy GET    /rails/active_storage/blobs/proxy/:signed_id/*filename(.:format)                                  active_storage/blobs/proxy#show
                                         GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                                        active_storage/blobs/redirect#show
               rails_blob_representation GET    /rails/active_storage/representations/redirect/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations/redirect#show
         rails_blob_representation_proxy GET    /rails/active_storage/representations/proxy/:signed_blob_id/:variation_key/*filename(.:format)    active_storage/representations/proxy#show
                                         GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format)          active_storage/representations/redirect#show
                      rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                                       active_storage/disk#show
               update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                               active_storage/disk#update
                    rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                                    active_storage/direct_uploads#create
