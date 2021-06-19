module WorkspaceHelper

    def futurepast(datetime)
        x= time_ago_in_words(datetime) + " ago"
        y= "in " +  distance_of_time_in_words(Time.now, datetime) #user time?
        datetime < Time.now ? x  : y      
    end

    # def itempills(items)
    #     html=""
    #     items.split(";").each do |i|   ##@refact temp
    #     html << "<li class='nav-item'> <a class='nav-link active pillitem' style='border-radius:25px' href='#FollowTag'>#{i.to_s}</a>  </li>"
    #     end
    
    #     raw("<ul class='nav nav-pills'>#{html} </ul>" )##@refact -user input as html
    # end   #@@refact obsolete


    def isjoinable?(session)
        dif = session.s_time - Time.now 
          dif > 100   ? true : false ##@refact - time til join is viable  
    end

    def updatepresence(userid, showdown)
        if showdown.presence.include?(userid) 
            p "nothing to update"
        else
            showdown.presence << userid 
            showdown.save!
            p "presence updated"
        end 
    end
end
