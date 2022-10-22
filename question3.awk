BEGIN { print "Which victim age group had the most cases resulting in death?"
     }

    $12 == 18-24{
        { print $12 }
    }


