require 'sinatra'
require 'json'

set :environment, :production
set :bind, '0.0.0.0'
set :port, Integer(ENV.fetch('PORT', '3000'))
set :server, :webrick

get '/' do
  content_type :html, charset: 'utf-8'
  <<~HTML
    <!doctype html>
    <html lang="fr">
      <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ruby / Sinatra — ValaDeploy</title>
        <style>
          body { margin: 0; min-height: 100vh; display: grid; place-items: center;
                 font-family: system-ui, sans-serif; background: #f4f6f9; color: #172033; }
          main { max-width: 650px; margin: 24px; padding: 48px; background: white;
                 border-radius: 18px; box-shadow: 0 12px 40px #18263c18; }
          small { color: #a62d40; font-weight: 700; letter-spacing: .08em; }
          h1 { font-size: clamp(1.8rem, 5vw, 3rem); line-height: 1.1; }
          a { color: #2451a2; }
        </style>
      </head>
      <body>
        <main>
          <small>UNIVERSAL BUILD · MODE MANUEL</small>
          <h1>Ruby/Sinatra déployé avec ValaDeploy — ManualStrategy</h1>
          <p>Cette application est construite avec la configuration manuelle de ValaDeploy.</p>
          <a href="/health">Vérifier l’état de l’application →</a>
        </main>
      </body>
    </html>
  HTML
end

get '/health' do
  content_type :json
  { status: 'ok', framework: 'Sinatra', build: 'manual' }.to_json
end
