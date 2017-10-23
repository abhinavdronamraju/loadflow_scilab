// Assumption, Bus 1 is considered as Slack bus.
function gauss(report);
    
global busdat;
global linedat;
  
Y = ybus();             // Calling program "ybus.sci" to get Y-Bus. 
busd = busdat;      // Calling "busdatas.sci" for bus data.
BMva= 100;                  // Base MVA  
bus = busd(:,1);            // Bus number.
nbus = max(bus);            // To get no. of buses
type_bus = busd(:,2);       // Type of Bus 1-Slack, 2-PV, 3-PQ.
V = busd(:,3);              // Initial Bus Voltages.
del = busd(:,4);            // Initial Bus Voltage Angles.
Pg = busd(:,5)/ BMva;             // Pgi, Real Power injected into the buses.
Qg = busd(:,6)/ BMva;             // Qgi, Reactive Power injected into the buses.
Pl = busd(:,7)/ BMva;             // Pli, Real Power Drawn from the buses.
Ql = busd(:,8)/ BMva;             // QLi, Reactive Power Drawn from the buses.
Qmin = busd(:,9)/ BMva;           // Minimum Reactive Power Limit
Qmax = busd(:,10)/ BMva;          // Maximum Reactive Power Limit
P = Pg-Pl;                  // Pi = PGi - PLi, Real Power at the buses.
Q = Qg-Ql;                  // Qi = QGi - QLi, Reactive Power at the buses.
Vprev = V; 
toler = 1;                  // Tolerence.
iteration = 1;              // iteration starting
while (toler > 0.00001)     // Start of while loop
    for i = 2:nbus
        sumyv = 0;
        for k = 1:nbus
            if i ~= k
                sumyv = sumyv + Y(i,k)* V(k);  // Vk * Yik
            end
        end
        if type_bus(i) == 2     // Computing Qi for PV bus
            Q(i) = -imag(conj(V(i))*(sumyv + Y(i,i)*V(i)));
            if (Q(i) > Qmax(i)) | (Q(i) < Qmin(i))  // Checking for Qi Violation.
                if Q(i) < Qmin(i)   // Whether violated the lower limit.
                    Q(i) = Qmin(i);
                else    // No, violated the upper limit.
                    Q(i) = Qmax(i);
                end
                type_bus(i) = 3;  // If Violated, change PV bus to PQ bus.
            end
        end
        V(i) = (1/Y(i,i))*((P(i)-(%i)*Q(i))/conj(V(i)) - sumyv); // Compute Bus Voltages.
        if type_bus(i) == 2 // For PV Buses, Voltage Magnitude remains same, but Angle changes.
            V(i) = pol2rect(abs(Vprev(i)), atan(imag(V(i)), real((V(i)))));
        end
    end
    iteration = iteration + 1;      // Increment iteration count.
    toler = max(abs(abs(V) - abs(Vprev)));     // Calculate tolerance.
    Vprev = V; // Vprev is required for next iteration,  V(i) = pol2rect(abs(Vprev(i)), atan(imag(V(i)), real((V(i)));
end     // End of while loop / Iteration

Ang = atan(imag(V), real(V));    // Final Bus Voltage Angles in Degree.

loadflow(nbus, V, Ang, BMva, 'gs', report);

endfunction
