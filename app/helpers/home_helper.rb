module HomeHelper
    def isonlanding?
        current_page?(root_path)
    end

    def isonshowdown?
        current_page?(showdown_path)
    end

end
