class User
  # ユーザー名とメールアドレスに対応するアクセサーを作成。@nameと@emailにアクセスするためのメソッドが用意される
  attr_accessor :name, :email
  # User.newを実行すると自動的に呼び出されるメソッド。それぞれの変数に値を代入する
  def initialize(attributes = {})
    @name = attributes[:name]
    @email = attributes[:email]
  end
  # 文字列の式展開を利用して、@nameと@emailに割り当てられた値をユーザーのメールアドレスとして構成する
  def formatted_email
    "#{@name} <#{@email}>"
  end
end