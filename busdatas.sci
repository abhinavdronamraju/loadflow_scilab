//Returns Initial Bus datas of the system...

function busdt = busdatas()

//Type....
//1 - Slack Bus..
//2 - PV Bus..
//3 - PQ Bus..

//        |Bus | Type | Vsp | theta | PGi | QGi | PLi | QLi | Qmin | Qmax |
busdt    =[ 1     1    1.04     0     0     0    200    200      0      0;
            2     3    1        0     50    100   0      0       0      0;
            3     2    1.04     0     0     0    150     60      0    150;];

endfunction
