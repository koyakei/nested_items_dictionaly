class SigninController < ApplicationController
  def create
    response.header["Authorization"] = Aws::CognitoIdentityProvider::Client.new(region: 'ap-northeast-1').admin_initiate_auth({
                                        user_pool_id: "ap-northeast-1_jowo5eFfa", # required
                                        client_id: "196fbvmncvl8crgf2bf0lbu8hf", # required
                                        auth_flow: "ADMIN_NO_SRP_AUTH", # required, accepts USER_SRP_AUTH, REFRESH_TOKEN_AUTH, REFRESH_TOKEN, CUSTOM_AUTH, ADMIN_NO_SRP_AUTH, USER_PASSWORD_AUTH
                                        auth_parameters: {
                                          "USERNAME" => params[:email],
                                          "PASSWORD" => params[:password],
                                        }
                                      }).authentication_result.id_token
  end
end