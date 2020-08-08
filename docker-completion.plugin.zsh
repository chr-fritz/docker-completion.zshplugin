# Copyright 2020 Christian Fritz <mail at chr-fritz dot de>
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

onMacOs() { [[ "$(uname -s)" = 'Darwin' ]]; }

addToFpathIfExists() {
    local file=$1
    if [[ -f "${file}" ]]; then
        fpath+=$file
    fi
}

dockerBasePath() {
    dirname $(dirname $(realpath $(which docker)))
}

registerCompletion(){
    basePath="$(dockerBasePath)"
    addToFpathIfExists "${basePath}/etc/docker.zsh-completion"
    addToFpathIfExists "${basePath}/etc/docker-machine.zsh-completion"
    addToFpathIfExists "${basePath}/etc/docker-compose.zsh-completion"
}

if onMacOs; then
    registerCompletion
fi
