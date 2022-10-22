#! /usr/bin/awk -f
BEGIN { FS = "," }
{
	if( $3 ~ /0[5-9]:[0-5][0-9]/ || /1[01]:[0-5][0-9]/ ) #morning
		morning++;
	else if($3 ~ /1[2-6]:[0-5][0-9]/ ) #afternoon
		noon++;
	else if($3 ~ /1[7-9]:[0-5][0-9]/ || /20:[0-5][0-9]/ ) #evening 
		evening++
	else if($3 ~ /2[1-3]:[0-5][0-9]/ || /0[0-4]:[0-5][0-9]/ ) #night
		night++

	count++ #total 

}
END {
	print "Total shootings: " count;
 	print "Amount of Shootings in the Morning: " morning;
	print "Amount of Shootings in the Afternoon: " noon;
	print "Amount of Shootings in the Evening: " evening;
	print "Amount of Shootings in the Night: " night;
}
