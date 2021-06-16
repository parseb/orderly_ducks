module WorkspaceHelper

    def futurepast(datetime)
        x= time_ago_in_words(datetime)
        datetime < Time.now ? x + " to go " : "in " + x     
    end

    def itempills(items)
        html=""
        items.split(";").each do |i|   ##@refact temp
        html << "<li class='nav-item'> <a class='nav-link active pillitem' style='border-radius:25px' href='#FollowTag'>#{i}</a>  </li>"
        end
    
        raw("<ul class='nav nav-pills'>#{html} </ul>" )##@refact -user input as html
    end
end
