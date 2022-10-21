#! /usr/bin/awk

BEGIN { FS=","; }

# $6: JURISDICTION_CODE
# $7: LOCATION_DESCRIPTION

# JURISDICTION_CODE: Patrol
$6 == 0 && NR != 1 {
    ++patrol_cases;
    ++patrol_locations[($7 == "") ? "UNKNOWN" : $7];
}

# JURISDICTION_CODE: Transit
$6 == 1 && NR != 1 {
    ++transit_cases;
    ++transit_locations[($7 == "") ? "UNKNOWN" : $7];
}

# JURISICTION_CODE: Housing
$6 == 2 && NR != 1 {
    ++housing_cases;
	++housing_locations[($7 == "") ? "UNKNOWN" : $7];
}

# JURISICTION_CODE: Other
$6 >= 3 && NR != 1 {
    ++other_cases;
}

NR != 1 { ++total; }

END {
    print "Total: "total"\n";

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
	print_locations(patrol_locations);
}

function display_transit() {
    print "Transit: "transit_cases" ("(transit_cases / total) * 100"% of total shootings)";
	print_locations(transit_locations);
}

function display_housing() {
    print "Housing: "housing_cases" ("(housing_cases / total) * 100"% of total shootings)";
	print_locations(housing_locations);
}

function display_other() {
    print "Other: "other_cases * 1" ("(other / total) * 100"% of total shootings)";
}

function sort_map(map, dest) {
	map_size = length(map);
	count = 0;
	for (key in map) {
		dest[count]["KEY"] = key;
		dest[count]["VALUE"] = map[key];
		count++;
	}

	# Selection Sort (non-ascending order)
	for (i = 0; i < map_size; ++i) {
		max_index = i;
		for (j = i + 1; j < map_size; ++j) {
			if (dest[j]["VALUE"] > dest[max_index]["VALUE"]) {
				max_index = j;
			}
		}

		temp_key = dest[i]["KEY"];
		temp_value = dest[i]["VALUE"];

		dest[i]["KEY"] = dest[max_index]["KEY"];
		dest[i]["VALUE"] = dest[max_index]["VALUE"];

		dest[max_index]["KEY"] = temp_key;
		dest[max_index]["VALUE"] = temp_value;
	}
}

function print_locations(map) {
	sort_map(map, sorted);
	size = length(map);
	for (i = 0; i < size; ++i) {
		print "\t"sorted[i]["KEY"]": "sorted[i]["VALUE"];
	}
}
