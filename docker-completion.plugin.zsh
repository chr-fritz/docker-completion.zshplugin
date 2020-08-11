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
__dockerCompletion_addToFpathIfExists() {
    local file=$1
    if [[ -f "${file}" ]]; then
        fpath+=$file
    fi
}

# Get the base path of the Docker for Mac installation.
# It assumes that the completions are relative to the real path of the docker command.
# This is the normal case for all Docker for Mac installations.
__dockerCompletion_basePath() {
    dirname $(dirname $(realpath $(which docker)))
}

# Registers the docker completions from the Docker for Mac installation.
__dockerCompletion_registerCompletion(){
    basePath="$(__dockerCompletion_basePath)"
    __dockerCompletion_addToFpathIfExists "${basePath}/etc/docker.zsh-completion"
    __dockerCompletion_addToFpathIfExists "${basePath}/etc/docker-machine.zsh-completion"
    __dockerCompletion_addToFpathIfExists "${basePath}/etc/docker-compose.zsh-completion"
}

__dockerCompletion_registerCompletion

