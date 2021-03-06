
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'http://localhost:4000'
    resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete], credentials: true
  end
    allow do
      origins 'https://germancruzclone.web.app'
      resource '*', headers: :any, methods: [:get, :post, :patch, :put, :delete], credentials: true
    end
  end