class PartialArts < Sinatra::Base

  helpers do
    def link_to_artist_show(artist)
      "<a href='/artists/#{artist.id}'>#{artist.first_name} #{artist.last_name}</a>"
    end

    def artist_div(artist)
      "<div class='artist'>
        <img src='#{artist.image_url}' alt=''> <br>
        <h3>#{link_to_artist_show(artist)}</h3>
      </div>"
    end

    def link_to_home
      "<a href='/'>Home</a>"
    end

  end

  get '/' do
    @belt_statistics     = Artist.group("belt").count
    @category_statistics = Artist.group("category").count
    @location_statistics = Artist.group("location").count
    erb :welcome
  end
end
