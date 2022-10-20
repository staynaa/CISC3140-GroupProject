#! /usr/bin/awk

BEGIN { FS=","; }

$6 == 0 && NR != 1 {
    ++patrol_cases;
    if ($7 == "") { $7 = "UNKNOWN"; }
    ++patrol_locations[$7];
}

$6 == 1 && NR != 1 {
    ++transit_cases;
    if ($7 == "") { $7 = "UNKNOWN"; }
    ++transit_locations[$7];
}

$6 == 2 && NR != 1 {
    ++housing_cases;
	if ($7 == "") { $7 = "UNKNOWN"; }
	++housing_locations[$7];
}

$6 >= 3 && NR != 1 {
    ++other_cases;
}

NR != 1 { ++total; }

END {
    print "Total: "total;
    print "";

    display_patrol();
    
    print "";

    display_transit();

    print "";

    display_housing();

    print "";

    display_other();
}

function display_patrol() {
	print "Patrol: "patrol_cases" ("(patrol_cases / total) * 100"% of total shootings)";
	for (location in patrol_locations) {
		print "\t"location": "patrol_locations[location] * 1;
	}
}

function display_transit() {
    print "Transit: "transit_cases" ("(transit_cases / total) * 100"% of total shootings)";
    for (location in transit_locations) {
    	print "\t"location": "transit_locations[location] * 1;
    }
}

function display_housing() {
    print "Housing: "housing_cases" ("(housing_cases / total) * 100"% of total shootings)";
	for (location in housing_locations) {
		print "\t"location": "housing_locations[location] * 1;
	}
}

function display_other() {
    print "Other: "other_cases * 1" ("(other / total) * 100"% of total shootings)";
}

