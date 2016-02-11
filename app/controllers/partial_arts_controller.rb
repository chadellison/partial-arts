class PartialArts < Sinatra::Base

  helpers do
    def link_to_artist_show(artist)
      "<a href='/artists/#{artist.id}'>#{artist.first_name} #{artist.last_name}</a>"
    end
  end

  get '/' do
    @belt_statistics     = Artist.group("belt").count
    @category_statistics = Artist.group("category").count
    @location_statistics = Artist.group("location").count
    erb :welcome
  end
end
