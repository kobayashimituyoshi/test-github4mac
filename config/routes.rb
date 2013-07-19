Board3::Application.routes.draw do
 root to: "sentences#index"

 post "/sentences/create_topic"=>"sentences#create_topic"
 get "/sentences/thread/:id"=>"sentences#thread"
 post "/sentences/thread/:id"=>"sentences#thread"
 post "/sentences/create_text/:id"=>"sentences#create_text"
end
