module ApplicationHelper
    def formatar_data(data)
        data.strftime('%d/%m/%y %H:%M') if data
    end

    def formatar_data_estreia(data)
        data.strftime('%d/%m/%y') if data
    end

    def set_cast(id)
        artists = Artist.find(id) 
    
        artists.map! do |artist|
            artist[:name] = artist[:name]
      end
    end
end
