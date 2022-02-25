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

# Adds the given file to the zsh variable fpath.
# Before adding it, it checks if the file exists.
__dockerCompletion_linkIfNeeded() {
    local file=$1
    local target="/usr/local/share/zsh/site-functions/$2"
    if [[ -f "${file}" && ! -e "${target}" ]]; then
        ln -s "${file}" "${target}"
    fi
}

# Get the base path of the Docker for Mac installation.
# It assumes that the completions are relative to the real path of the docker command.
# This is the normal case for all Docker for Mac installations.
__dockerCompletion_basePath() {
    docker_loc=$(which docker)
    dirname $(dirname ${docker_loc:A})
}

# Registers the docker completions from the Docker for Mac installation.
__dockerCompletion_registerCompletion(){
    basePath="$(__dockerCompletion_basePath)"
    __dockerCompletion_linkIfNeeded "${basePath}/etc/docker.zsh-completion" "_docker"
    __dockerCompletion_linkIfNeeded "${basePath}/etc/docker-machine.zsh-completion" "_docker-machine"
    __dockerCompletion_linkIfNeeded "${basePath}/etc/docker-compose.zsh-completion" "_docker-compose"
}

__dockerCompletion_registerCompletion
