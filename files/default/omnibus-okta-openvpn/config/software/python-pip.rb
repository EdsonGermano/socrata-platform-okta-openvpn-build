# Encoding: UTF-8
#
# Project Name:: okta-openvpn
# Software Name:: python-pip
#
# Copyright 2016, Socrata, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

name 'python-pip'
default_version '8.1.1'

dependency 'python'
dependency 'setuptools'

source url: "https://pypi.python.org/packages/source/p/pip/pip-#{version}.tar.gz",
       md5: '6b86f11841e89c8241d689956ba99ed7'

relative_path "pip-#{version}"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  command "#{install_dir}/embedded/bin/python setup.py install " \
          "--prefix=#{install_dir}/embedded", env: env
end
