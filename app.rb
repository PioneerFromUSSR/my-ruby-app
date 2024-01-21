require 'sinatra'
require 'mysql2'

get '/' do
  db_config = {
    host: '10.5.0.6', port:'6033', username: 'sbtest', password: 'passw0rd', database: 'app'
  }

  client = Mysql2::Client.new(db_config)
  client.query("INSERT INTO users (name) VALUES ('Test name')")
  results = client.query('SELECT * FROM users')

  content_type :json
  results.to_a.to_json
end
