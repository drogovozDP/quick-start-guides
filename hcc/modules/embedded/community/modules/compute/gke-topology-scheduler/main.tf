# Copyright 2024 Google LLC
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

module "kubectl_apply" {
  source = "../../../../modules/management/kubectl-apply"

  cluster_id = var.cluster_id
  project_id = var.project_id

  apply_manifests = [
    { source = "${path.module}/manifests/topology-scheduler-scripts.yaml" },
    { source = "${path.module}/manifests/service-account.yaml" },
    { source = "${path.module}/manifests/label-nodes-daemon.yaml" },
    { source = "${path.module}/manifests/schedule-daemon.yaml" }
  ]

  providers = {
    kubectl = kubectl
    http    = http
  }
}
