BEGIN { 
    print "Which victim age group had the most cases resulting in death?"

    FS = ","
}

#use a map that has the age-group as the key
#that value in that map, it contains the number of deaths according to the STATISTICAL_MURDER_FLAG

    $8 == "true" {
        ageRangeMap[$12]++
    }


END{
    for (key in ageRangeMap) {
        print key
        print ageRangeMap[key]
        print "______"
	}
}

    




