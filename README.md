# Eaccelerator-cookbook

This cookbooks build and install the eaccelerator php plugins.

## Supported Platforms

* debian 7 (only)

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['eaccelerator']['activate']</tt></td>
    <td>Boolean</td>
    <td>Activate the plugin</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### eaccelerator::default

Include `eaccelerator` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[eaccelerator::default]"
  ]
}
```

## License and Authors

Author: Leonard TAVAE (<leonard.tavae@informatique.gov.pf>)

```text
# Copyright (C) 2014 Leonard TAVAE
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
```
