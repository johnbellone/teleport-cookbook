#
# Cookbook: teleport
# License: Apache 2.0
#
# Copyright 2016, Bloomberg Finance L.P.
#
default['teleport']['version'] = '1.0.0'
default['teleport']['prefix'] = '/opt'
default['teleport']['archive_url'] = "https://github.com/gravitational/teleport/releases/download/v%{version}/teleport-v%{version}-%{os}-%{arch}-bin.tar.gz"
