name 'default'
default_source :community
cookbook 'teleport', path: '.'
cookbook 'ubuntu'
cookbook 'redhat'
run_list 'teleport::default'
named_run_list :redhat, 'redhat::default', run_list
named_run_list :ubuntu, 'ubuntu::default', run_list
