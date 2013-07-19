class SentencesController < ApplicationController
 def index
     @topics=Topic.order("id")
 end
 def create_topic
  data=params["written_data"]
  @topic=Topic.new
  @topic["title"]=data["topic_name"]
  @topic["id"]=Topic.count+1
  @id = @topic["id"]
  @topic.save
  params[:id]=@id
    @thread_title=Topic.find(params["id"]) 
  create_text
 end
 def create_text
  #skip_before_filter :verify_authenticity_token
  data=params["written_data"]
  @text=Text.new
  @text["thread_number"]=params[:id]
  @text["name"]=data["name"]
  @text["body"]=data["text"]
 
  if cookies[:kobayashi_no_keiziban] != 'user'
     cookies[:kobayashi_no_keiziban] = {:value=>'user',:expries=> 365000.days.from_now}
     cookies[:kobayashi_no_keiziban_id]={:value=>rand(9999999999),:expries=> 365000.days.from_now}


  end

  @text["cook"]= cookies[:kobayashi_no_keiziban_id]
  @text.save
  @id=params[:id]
 end
 def thread
   @sentences=Text.find(:all, :conditions=>{:thread_number=>params["id"] })
   @thread_title=Topic.find(params[:id]);
   @id=params[:id]
 end
 
end
