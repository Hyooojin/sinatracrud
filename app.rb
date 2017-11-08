require 'sinatra'
require 'date'
require 'csv'
require 'thin'
require 'data_mapper' 


DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/post.db")
class Post
  include DataMapper::Resource
  property :id, Serial
  property :title, String
  property :content, Text
  property :created_at, DateTime
end
# create table

DataMapper.finalize # 데이터베이스를 (clss로 정의한 친구를 테이블 생성으로) 마무리 한다
# create Database

Post.auto_upgrade! #pㅐㄴㅅfksms table을 자동으로 업그레이드 할게



get '/' do
    erb :index # views라는 폴더 안에 있는 파일
end

get '/create' do
   @title = params[:title]
   @content = params[:content]
   
#   CSV.open('board.csv', 'a+') do |csv|
#       csv << [@title, @content, Time.now.to_s]
#   end
   
   
   Post.create(
       title: @title, #앞서 정의한 곳에 값을 넣는다.
       content: @content
       )
   erb :create 
   
end