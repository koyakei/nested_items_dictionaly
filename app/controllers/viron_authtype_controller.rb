class VironAuthtypeController < ApplicationController
  def index
    render json: [{
                    type: 'oauth', # OAuth認証を利用する場合のtype
    provider: 'google', # OAuthを提供するプロバイダ。
    url: 'https://makxastest.auth.ap-northeast-1.amazoncognito.com/login?response_type=code&client_id=196fbvmncvl8crgf2bf0lbu8hf&redirect_uri=https://localhost:8080/#/SkzXmh7qG/quick_view',
      method: 'POST',
    },{
                    type: 'signout',
                    provider: '',
                    url: '/signout',
                    method: 'POST',
                  }]
  end
end