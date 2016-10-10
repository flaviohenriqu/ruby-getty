json.extract! instrutor, :id, :nome, :email, :profissao, :created_at, :updated_at
json.url instrutor_url(instrutor, format: :json)