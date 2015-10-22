class PartialArts < Sinatra::Base
  helpers do
    def artists_url
      "<a href='/artists'>All Artists</a>"
    end
  end

  get '/' do
    @belt_statistics     = Artist.group("belt").count
    @category_statistics = Artist.group("category").count
    erb :welcome
  end

  get '/artists' do
    @artists = Artist.all
    erb :artists_index
  end

  get '/belts' do
    @belts = Belt.all
    erb :belts_index
  end

  get '/categories' do
    @categories = Category.all
    erb :categories_index
  end
end