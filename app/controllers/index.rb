get '/' do
  @posts = Post.order('vote_count asc').order('created_at desc')
  erb :index
end


get '/new_post' do
  erb :new_post
end

get '/create_comment/:post_id' do
  @post_id = params[:post_id]
  erb :create_comment
end

post '/create_comment' do
  user = User.find(session[:user_id])
  post = Post.find(params[:post_id].to_i)
  comment = Comment.create(body: params[:body])
  user.comments << comment
  post.comments << comment
  redirect "/post/#{params[:post_id]}"
end  


get '/comments' do
  @comments = Comment.all
  erb :comments
end

get '/sign_in' do
  erb :login
end

post '/sign_up' do
  user = User.create(name: params[:username], email: params[:email], password: params[:password])
  session[:user_id] = user.id
  redirect '/'
end



get '/log_out' do
  session.clear
  redirect '/'
end


get '/post/:post_id' do
  @post = Post.find(params[:post_id])
  @comments=Comment.where(post_id: params[:post_id]).order('vote_count ASC')
  erb :post_page
end

post '/new_post' do
  user = User.find(session[:user_id])
  user.posts << Post.create(title: params[:title], body: params[:body])

  redirect '/'
end

post '/login' do
  user = User.find_by_email(params[:email])
  if user
    if user.password == params[:password]
      session[:user_id] = user.id
      redirect '/'
    else
      # failed password
      @error = 'password failed'
      erb :failed_login
    end
  else 
    # email does not exist
    @error = 'email does not exist'
    erb :failed_login
  end
end


post '/post_vote' do
  post = Post.find(params[:post_id])
  post.post_votes.create(user_id: session[:user_id])
  post.increment!(:vote_count)
end


post '/comment_vote' do
  comment = Comment.find(params[:comment_id])
  comment.comment_votes.create(user_id: session[:user_id])
  comment.increment!(:vote_count)
end  




