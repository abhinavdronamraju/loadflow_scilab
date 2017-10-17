// Returns Line datas of the system...

function linedt = linedatas()


//        |  From |  To   |   R   |   X   |   B/2 |
//        |  Bus  | Bus   |       |       |       |
linedt=    [ 1      2       0.02    0.08     0.01  ;
             1      3       0.02    0.08     0.01  ;
             2      3       0.02    0.08     0.01  ;];

endfunction
