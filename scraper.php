<?php

// http://www2.usfirst.org/2013comp/events/CASJ/ScheduleQual.html
// http://www2.usfirst.org/2013comp/events/CASJ/scheduleelim.html

$raw = "1:30 PM	Qtr 1-1	1	118	1967	254	115	766	2489
1:38 PM	Qtr 2-1	2	3598	148	1662	100	233	846
1:46 PM	Qtr 3-1	3	973	1868	4159	2144	840	670
1:54 PM	Qtr 4-1	4	971	192	604	114	1388	649
2:02 PM	Qtr 1-2	5	1967	118	254	2489	115	766
2:10 PM	Qtr 2-2	6	1662	148	3598	233	100	846
2:18 PM	Qtr 3-2	7	4159	1868	973	2144	840	670
2:26 PM	Qtr 4-2	8	192	971	604	1388	649	114
2:34 PM	Qtr 1-3	9	254	118	1967	115	766	2489
2:42 PM	Qtr 2-3	10	148	3598	1662	233	100	846
2:50 PM	Qtr 3-3	11	4159	1868	973	2144	670	840
2:58 PM	Qtr 4-3	12	192	604	971	649	114	1388
3:06 PM	Semi 1-1	13	0	0	0	0	0	0
3:14 PM	Semi 2-1	14	0	0	0	0	0	0
3:22 PM	Semi 1-2	15	0	0	0	0	0	0
3:30 PM	Semi 2-2	16	0	0	0	0	0	0
3:38 PM	Semi 1-3	17	0	0	0	0	0	0
3:46 PM	Semi 2-3	18	0	0	0	0	0	0
3:54 PM	Final 1-1	19	0	0	0	0	0	0
4:02 PM	Final 1-2	20	0	0	0	0	0	0
4:10 PM	Final 1-3	21	0	0	0	0	0	0";
$base = [
'time'  ,
'match' ,
'desc'  ,
'red1'  ,
'red2'  ,
'red3'  ,
'blue1' ,
'blue2' ,
'blue3' ,
];
foreach (explode("\n", $raw) as $row) {
	$match= array_combine($base, explode("\t",$row));
	unset($match['desc']);
	$matches[] = $match;
}
echo str_replace('"', '\"', json_encode($matches)); // escape quotes for copy-paste into Obj-C code
