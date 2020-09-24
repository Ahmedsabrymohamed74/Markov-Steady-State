%%%% To run the project: Press Run no need to call in command window  %%%%

%Transition Matrices:

persistent_CSMA = [0  0.76 0.06 0.06 0.06 0.06;
              0.5 .5 0 0 0 0;
              0 1 0 0 0 0;
              0 0 1 0 0 0;
              0 0 0 1 0 0;
              0 0 0 0 1 0];
          
non_persistent_CSMA = [0  0.76 0.06 0.06 0.06 0.06;
              0.5 .1 0.1 0.1 0.1 0.1;
              0 1 0 0 0 0;
              0 0 1 0 0 0;
              0 0 0 1 0 0;
              0 0 0 0 1 0];
          
p_persistent_CSMA = [0  0.76 0.06 0.06 0.06 0.06;
              0.1 .9 0 0 0 0;
              0 1 0 0 0 0;
              0 0 1 0 0 0;
              0 0 0 1 0 0;
              0 0 0 0 1 0];
          
%Displaying Markov Models: Bonus please!!!

figure('Name', 'CSMA Markov Models');
mc_per = dtmc(persistent_CSMA,'StateNames',["Stx" "Ssense" "Sw1" "Sw2" "Sw3" "Sw4"]);
subplot(2,2,2);
graphplot(mc_per,'ColorEdges',true);
title('Persistent');

mc_nonper = dtmc(non_persistent_CSMA,'StateNames',["Stx" "Ssense" "Sw1" "Sw2" "Sw3" "Sw4"]);
subplot(2,1,2);
graphplot(mc_nonper,'ColorEdges',true);
title('Non-Persistent');

mc_p_per = dtmc(p_persistent_CSMA,'StateNames',["Stx" "Ssense" "Sw1" "Sw2" "Sw3" "Sw4"]);
subplot(2,2,1);
graphplot(mc_p_per,'ColorEdges',true);
title('P-Persistent');



%Calculation:
Pii_persistent = Transition(persistent_CSMA);
Pii_non_persistent = Transition(non_persistent_CSMA);
Pii_p_persistent = Transition(p_persistent_CSMA);

disp('Sense State probability in: ');
disp(['Persistent = ',num2str(Pii_persistent(2))]);
disp(['Non-Persistent = ',num2str(Pii_non_persistent(2))]);
disp(['P-Persistent = ',num2str(Pii_p_persistent(2))]);

function [p] = Transition(M)
    n = size(M,2);
    p = [zeros(1,n),1]/[M-eye(n),ones(n,1)];

end