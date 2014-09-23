# ForemanEncHostgrouponly

This rails engine/plugin to Foreman leverages the existing ENC functionality meanwhile only return data that being overriden in hostgroup. This would allow user sepereate ENC/classes and data management so data could be managed in an auditable manner.


## Installation

See [How_to_Install_a_Plugin](http://projects.theforeman.org/projects/foreman/wiki/How_to_Install_a_Plugin)
for how to install Foreman plugins

The gem name is "foreman_enc_hostgrouponly". 

## Compatibility


| Foreman Version | Plugin Version |
| --------------- | --------------:|
| >= 1.5          | 1.0.0          |

## Usage
There is a new setting under `Settings -> General`
| Setting | Description |
| ------- | ----------- |
| `enc_hostgrouponly` | Setting this to `true` will let ENC return host group parameters only  Default: `false` |


## Contributing

Fork and send a Pull Request. Thanks!

## Copyright

Copyright (c) *2014* *Huai Jiang*

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

