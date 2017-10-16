function start( alg )

 exec pol2rect.sci;
 exec linedatas.sci;
 exec busdatas.sci;
 exec loadflow.sci;
 exec ybus.sci;

if(alg == 'nr')
	exec nrlf.sci


elseif ( alg == 'gs')
	exec gauss.sci

end


endfunction 
