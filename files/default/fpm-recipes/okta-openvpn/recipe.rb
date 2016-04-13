# Encoding: UTF-8
#
# FPM Recipe:: okta-openvpn
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

require 'net/http'
require 'fpm/cookery/recipe'

# A FPM Cookery recipe for the Okta-OpenVPN plugin
#
# @author Jonathan Hartman <jonathan.hartman@socrata.com>
class OktaOpenvpn < FPM::Cookery::Recipe
  name 'okta-openvpn'

  version ENV['BUILD_VERSION']
  revision ENV['BUILD_REVISION']

  description 'The Okta plugin for OpenVPN'
  homepage 'https://github.com/okta/okta-openvpn'
  source 'https://github.com/okta/okta-openvpn',
         with: :git,
         tag: "v#{version}"

  maintainer 'Jonathan Hartman <jonathan.hartman@socrata.com>'
  vendor 'Socrata, Inc.'

  license 'Apache, version 2.0'

  build_depends %w(python-pip python-dev libssl-dev swig)

  depends %w(python-urllib3 python-m2crypto python-certifi)

  chain_package true
  chain_recipes 'python-certifi'

  def build
    make
  end

  def install
    make :install, DESTDIR: destdir
  end
end