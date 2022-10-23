#! /usr/bin/awk
#  
#  Calculating the frequency of shooting victims  over the spawn of 15 years 
#   (2006-2021) depending on the season.
#
#Spring: March-May.
#Summer: June-August.
#Autumn: September-November.
#Winter: December-February.

BEGIN {FS = ","}
      { 
	if ($2 ~ /^(03|04|05)/) 		#matches dates depending on month
		{ ++shootingsInSpring;}
	if ($2 ~ /^(06|07|08)/)
		{ ++shootingsInSummer;}
	if ($2 ~ /^(09|10|11)/)
		{ ++shootingsInAutumn;}
	if ($2 ~ /^(12|01|02)/)
		{ ++shootingsInWinter;}

numberOfDaysIn15Years = 5843

#for the frequency, we divide the number of instances of victims by the number of days between the start of  2006 and the end of 2021

freqShootingsInSpring = shootingsInSpring/numberOfDaysIn15Years
freqShootingsInSummer = shootingsInSummer/numberOfDaysIn15Years
freqShootingsInAutumn = shootingsInAutumn/numberOfDaysIn15Years
freqShootingsInWinter = shootingsInWinter/numberOfDaysIn15Years
	
      }  	
END   {
	print "\t Seasonal frequency of shooting victims in NYC  2006-2021";

	print "\n* Frequency of shooting victims during Spring: " freqShootingsInSpring;
	print "\n* Frequency of shooting victims during Summer: " freqShootingsInSummer;
	print "\n* Frequency of shooting victims during Autumn: " freqShootingsInAutumn;
	print "\n* Frequency of shooting victims during Winter: " freqShootingsInWinter;

	print "\n ---- There's a frequency increase of shooting victims during the summers from 2006 until 2021 in NYC. ---- ";
	print "";
      }
