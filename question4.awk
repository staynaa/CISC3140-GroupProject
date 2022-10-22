BEGIN { 
    print "Based on empty perpertrator information, which boroughs have more unsolved homicides?"
    
    FS = ","
}
#8,9,10 if they're empty, we probably didn't catch em

    $9 == "" && $10 == "" && $11 == ""{
        boroughCount[$4]++
    }


END{
    print "start"
    for (key in boroughCount) {
        print key
        print boroughCount[key]
        print "______"
	}
}
