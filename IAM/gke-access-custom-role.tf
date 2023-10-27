resource "google_project_iam_custom_role" "gke-access" {
  role_id     = "gkeAccessCustomRole"
  title       = "GKE Accessor Custom Role"
  description = "GKE Accessor to VM Custom Role"

  permissions = [
    #GKE Cluster Permissions:
    "roles/container.clusterViewer", //Grants read-only access to GKE clusters.
    "roles/container.clusterAdmin", //Grants full access to GKE clusters, including managing nodes, pods, and deployments.
    "roles/container.admin", //Grants administrative access to GKE clusters, including managing clusters, nodes, and cluster-level resources.

    # Node Management Permissions:
    "roles/compute.viewer", //Grants read-only access to Compute Engine resources, which includes GCE instances/nodes.
    "roles/compute.instanceAdmin", //Grants permission to create, start, stop, and delete Compute Engine instances/nodes.
    "roles/compute.instanceGroupAdmin", //Grants permission to manage instance groups, which can be useful for autoscaling and managing node pools.
   
    # Image Registry Permissions:
    "roles/container.imagePuller", //Grants permission to pull images from a Google Container Registry (GCR) repository.
    "roles/container.developer", //Grants permission to push and pull images from a GCR repository.

    # Permissions for MongoDB and Node.js:
    "roles/storage.objectViewer", //Grants read-only access to Cloud Storage objects. This might be necessary if your MongoDB or Node.js images are stored in Cloud Storage buckets.
    "roles/storage.objectCreator",

    "roles/compute.instanceAdmin.v1", //(to create instances)
    "roles/compute.diskAdmin", //(to create disks)
    "roles/compute.networkAdmin", //(to manage subnetworks)
    "roles/compute.securityAdmin", //(to set instance metadata)
    "compute.instances.create",
    "compute.disks.create",
    "compute.subnetworks.use",
    "compute.instances.setMetadata",
    "compute.subnetworks.useExternalIp",
    "compute.instanceGroups.update"
  ]

}
