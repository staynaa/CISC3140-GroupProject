BEGIN { FS=","; }

$6 == 0 && NR != 1 {
    ++patrol;
    switch ($4) {
        case "BRONX": ++patrol_bronx; break;
        case "BROOKLYN": ++patrol_brooklyn; break;
        case "MANHATTAN": ++patrol_manhattan; break;
        case "QUEENS": ++patrol_queens; break;
        case "STATEN ISLAND": ++patrol_staten_island; break;
    }
}

$6 == 1 && NR != 1 {
    ++transit;
    switch ($4) {
        case "BRONX": ++transit_bronx; break;
        case "BROOKLYN": ++transit_brooklyn; break;
        case "MANHATTAN": ++transit_manhattan; break;
        case "QUEENS": ++transit_queens; break;
        case "STATEN ISLAND": ++transit_staten_island; break;
    }
}

$6 == 2 && NR != 1 {
    ++housing;
    switch ($4) {
        case "BRONX": ++housing_bronx; break;
        case "BROOKLYN": ++housing_brooklyn; break;
        case "MANHATTAN": ++housing_manhattan; break;
        case "QUEENS": ++housing_queens; break;
        case "STATEN ISLAND": ++housing_staten_island; break;
    }
}

$6 >= 3 && NR != 1 {
    ++other;
    switch ($4) {
        case "BRONX": ++other_bronx; break;
        case "BROOKLYN": ++other_brooklyn; break;
        case "MANHATTAN": ++pothermanhattan; break;
        case "QUEENS": ++other_queens; break;
        case "STATEN ISLAND": ++other_staten_island; break;
    }
}

{ ++total; }

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
    print "Patrol: "patrol" ("(patrol/total)*100"% of total shootings)"
    print "\tBronx: "patrol_bronx" ("(patrol_bronx/patrol)*100"% of patrol cases, "(patrol_bronx/total)*100"% of total shootings)";
    print "\tBrooklyn: "patrol_brooklyn" ("(patrol_brooklyn/patrol)*100"% of patrol cases, "(patrol_brooklyn/total)*100"% of total shootings)";
    print "\tManhattan: "patrol_manhattan" ("(patrol_manhattan/patrol)*100"% of patrol cases, "(patrol_manhattan/total)*100"% of total shootings)";
    print "\tQueens: "patrol_queens" ("(patrol_queens/patrol)*100"% of patrol cases, "(patrol_queens/total)*100"% of total shootings)";
    print "\tStaten Island: "patrol_staten_island" ("(patrol_staten_island/patrol)*100"% of patrol cases, "(patrol_staten_island/total)*100"% of total shootings)";
}

function display_transit() {
    print "Transit: "transit" ("(transit/total)*100"% of total shootings)"
    print "\tBronx: "transit_bronx" ("(transit_bronx/transit)*100"% of transit cases, "(transit_bronx/total)*100"% of total shootings)";
    print "\tBrooklyn: "transit_brooklyn" ("(transit_brooklyn/transit)*100"% of transit cases, "(transit_brooklyn/total)*100"% of total shootings)";
    print "\tManhattan: "transit_manhattan" ("(transit_manhattan/transit)*100"% of transit cases, "(transit_manhattan/total)*100"% of total shootings)";
    print "\tQueens: "transit_queens" ("(transit_queens/transit)*100"% of transit cases, "(transit_queens/total)*100"% of total shootings)";
    print "\tStaten Island: "transit_staten_island" ("(transit_staten_island/transit)*100"% of transit cases, "(transit_staten_island/total)*100"% of total shootings)";
}

function display_housing() {
    print "Housing: "housing" ("(housing/total)*100"% of total shootings)"
    print "\tBronx: "housing_bronx" ("(housing_bronx/housing)*100"% of housing cases, "(housing_bronx/total)*100"% of total shootings)";
    print "\tBrooklyn: "housing_brooklyn" ("(housing_brooklyn/housing)*100"% of housing cases, "(housing_brooklyn/total)*100"% of total shootings)";
    print "\tManhattan: "housing_manhattan" ("(housing_manhattan/housing)*100"% of housing cases, "(housing_manhattan/total)*100"% of total shootings)";
    print "\tQueens: "housing_queens" ("(housing_queens/housing)*100"% of housing cases, "(housing_queens/total)*100"% of total shootings)";
    print "\tStaten Island: "housing_staten_island" ("(housing_staten_island/housing)*100"% of housing cases, "(housing_staten_island/total)*100"% of total shootings)";
}

function display_other() {
    print "Other: "other*1" ("(other/total)*100"% of total shootings)"
    # print "\tBronx: "other_bronx" ("(other_bronx/other)*100"% of other cases, "(other_bronx/total)*100"% of total shootings)";
    # print "\tBrooklyn: "other_brooklyn" ("(other_brooklyn/other)*100"% of other cases, "(other_brooklyn/total)*100"% of total shootings)";
    # print "\tManhattan: "other_manhattan" ("(other_manhattan/other)*100"% of other cases, "(other_manhattan/total)*100"% of total shootings)";
    # print "\tQueens: "other_queens" ("(other_queens/other)*100"% of other cases, "(other_queens/total)*100"% of total shootings)";
    # print "\tStaten Island: "other_staten_island" ("(other_staten_island/other)*100"% of other cases, "(other_staten_island/total)*100"% of total shootings)";
}

