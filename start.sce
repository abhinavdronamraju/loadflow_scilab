
global busdat;
global linedat;


//Bus data Specifications
//Type....
//1 - Slack Bus..
//2 - PV Bus..
//3 - PQ Bus..
//      |Bus | Type | Vsp | theta | PGi | QGi | PLi | QLi | Qmin | Qmax |
busdat  =[ 1     1    1.04     0     0     0    200    200      0      0;
           2     3    1        0     50    100   0      0       0      0;
           3     2    1.04     0     0     0    150     60      0    150;];
                 
                 
//Line Data Specifications                 
//          |  From |  To   |   R   |   X   |   B/2 |
//          |  Bus  | Bus   |       |       |       |
linedat=    [ 1      2       0.02    0.08     0.01  ;
              1      3       0.02    0.08     0.01  ;
              2      3       0.02    0.08     0.01  ;];


getd .;
disp("Enter the type of Algorithm");
disp("nr ---> Newton_Raphson");
disp("gs --> Gauss_Siedel");
Alg=input("--->","string");
disp("Do u want the printed report in txt format y/n---");
Rep=input("--->","string");
if(Alg=='nr' & Rep=='y')
    nrlf(1);
elseif(Alg=='nr' & Rep=='n')
    nrlf(0);
elseif(Alg=='gs' & Rep=='y')
    gauss(1);
elseif(Alg=='gs' & Rep=='n')
gauss(0);
end

