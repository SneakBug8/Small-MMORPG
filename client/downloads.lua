function statuslistener( event )

    if ( event.isError ) then
        print( "Network error: ", event.response )
        charstatus="Житель"
    else
        print ( "RESPONSE: " .. event.response )
        charstatus=event.response
        if string.match (charstatus,"404")==nil then
            else
        charstatus="Житель"
    end
        return charstatus
    end
end
function armor1listener( event )

    if ( event.isError ) then
        print( "Network error: ", event.response )
        charstatus="Житель"
    else
        print ( "RESPONSE: " .. event.response )
        armor={event.response}
        return armor[1]
    end
end
function armor2listener( event )

    if ( event.isError ) then
        print( "Network error: ", event.response )
        charstatus="Житель"
    else
        print ( "RESPONSE: " .. event.response )
        armor={}
        armor[2]=event.response
        return armor[2]
    end
end
function weapon1listener( event )

    if ( event.isError ) then
        print( "Network error: ", event.response )
        charstatus="Житель"
    else
        print ( "RESPONSE: " .. event.response )
       weapon={event.response}
        return weapon[1]
    end
end

function weapon2listener( event )

    if ( event.isError ) then
        print( "Network error: ", event.response )
        charstatus="Житель"
    else
        print ( "RESPONSE: " .. event.response )
        weapon={}
        weapon[2]=event.response
        return weapon[2]
    end
end

function moneylistener( event )

    if ( event.isError ) then
        print( "Network error: ", event.response )
        charstatus="Житель"
    else
        print ( "RESPONSE: " .. event.response )
       money=event.response
       addmoney(money)
        return money
    end
end