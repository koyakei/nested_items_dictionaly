class VironController < ApplicationController
  def index
    render json: {
      "theme": "standard",
      "color": "white",
      "name": "Viron example - local",
      "tags": [
        "local",
        "viron",
        "example"
      ],
      "thumbnail": "https:#avatars3.githubusercontent.com/u/23251378?v=3&s=200",

      "pages": [
        {
          "section": "dashboard",
          "group": "", ## 中項目。空の場合はsection直下にcomponentsを配置
          "id": "quick_view", # ページのID。全ページでユニークになっている必要があります
          "name": "クイックビュー", # ページ名
          "components": [# メニューからページを選択した際に表示されるコンポーネントの一覧
            # {
            #   "api": {# コンポーネントに表示する値を取得するためのAPI
            #           "method": "get",
            #           "path": "/stats/dau"
            #   },
            #   "name": "DAU", # コンポーネント名
            #   "style": "number" # コンポーネントスタイル。数字(number)、テーブル(table)の他に各種グラフ(graph-*)が利用できます
            # },
            # {
            #   "api": {
            #     "method": "get",
            #     "path": "/stats/mau"
            #   },
            #   "name": "MAU",
            #   "style": "number"
            # },
          ],
        },
        {
          "section": "manage",
          "group": "items",
          "id": "items",
          "name": "アイテム",
          "components": [
            {
              "api": {
                "method": "get",
                "path": "/items"
              },
              "name": "アイテム",
              "style": "table",
              "primary": "id", # テーブルデータの主キーにあたるフィールド
              "query": [# テーブルスタイルの検索フィールドを指定
                {
                  "key": "id",
                  "type": "integer"
                },
                {
                  "key": "created_at",
                  "type": "string"
                },
                {
                  "key": "updated_at",
                  "type": "string"
                }
              ],
              "table_labels": [# テーブルスタイルの見出しにするフィールドを指定
                %w(id created_at updated_at)
              ]
            },
            {
              "api": {
                "method": "get",
                "path": "/users"
              },
              "name": "ユーザー",
              "style": "table",
              "primary": "id", # テーブルデータの主キーにあたるフィールド
              "query": [# テーブルスタイルの検索フィールドを指定
                {
                  "key": "id",
                  "type": "integer"
                },
                {
                  "key": "created_at",
                  "type": "string"
                },
                {
                  "key": "updated_at",
                  "type": "string"
                }
              ],
              "table_labels": [# テーブルスタイルの見出しにするフィールドを指定
                "id"
              ]
            }
          ],
        }
      ]
    }
  end
end