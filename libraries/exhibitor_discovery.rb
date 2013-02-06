#
# Cookbook Name:: exhibitor_discovery
#
# Copyright 2013, Simple Finance Technology Corp.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


require 'json'
require 'net/http'
require 'uri'


def discover_zookeepers(exhibitor_host)
    url = URI.parse(exhibitor_host) + '/exhibitor/v1/cluster/list'
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
          http.request(req)
    }
    return JSON.parse(res.body)
end
