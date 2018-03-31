class VironAuthtypeController < ApplicationController
  def index
    render json: [{type: "email", provider: "viron-demo", url: "/signin", method: "POST"},{
                    type: 'oauth', # OAuth認証を利用する場合のtype
    provider: 'google', # OAuthを提供するプロバイダ。
    url: '/googlesignin',
      method: 'POST',
    },{
                    type: 'signout',
                    provider: '',
                    url: '/signout',
                    method: 'POST',
                  }]
  end
end