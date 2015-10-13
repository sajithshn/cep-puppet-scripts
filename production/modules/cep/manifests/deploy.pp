#
# Copyright (c) 2015, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
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
# ----------------------------------------------------------------------------
#
# Executes the deployment by pushing all necessary configurations and patches

define cep::deploy ($service, $target, $owner, $group) {
  file { $target:
    ensure       => present,
    owner        => $owner,
    group        => $group,
    mode         => '0755',
    sourceselect => all,
    ignore       => '.svn',
    recurse      => remote,
    source       => [
      "puppet:///modules/${service}/configs/",
      "puppet:///modules/${service}/patches/"]
  }
}
