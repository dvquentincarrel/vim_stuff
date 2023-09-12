inoreabbrev <buffer> ipdbi import ipdb; ipdb.set_trace()
inoreabbrev <buffer> pdbi import pdb; pdb.set_trace()
command PrintFunc g/def \w\+(/norm ^wyiwoprint('"')
command PrintStack g/def \w\+(/put ='stack_depth()' | g/stack_depth()/norm ==
