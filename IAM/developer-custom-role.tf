resource "google_project_iam_custom_role" "developer-role" {
  role_id     = "DeveloperCustomRole"
  title       = "Developer Custom Role"
  description = "Developer to VM Custom Role"

  permissions = ["roles/artifactregistry.reader"
  ,"artifactregistry.repositories.uploadArtifacts"
  ,"artifactregistry.repositories.downloadArtifacts"
  ,"artifactregistry.repositories.create"
  ,"artifactregistry.repositories.get"	/*Can get a repository from Artifact Registry*/
  ,"artifactregistry.repositories.list"
  ,"iam.serviceAccounts.create"
  ,"iam.serviceAccounts.get"
  ,"roles/iam.serviceAccountTokenCreator" /*Impersonating Service Accounts*/
  ,"roles/iam.serviceAccountUser"
  ,"roles/storage.admin" /*Accessing the bucket*/
  ,"roles/iap.tunnelResourceAccessor"
  ,"roles/iap.admin" /*Accessing using IAP*/
  ,"roles/iap.settingsAdmin"
  ,"roles/resourcemanager.projectIamAdmin" /*To create iam custom role in the project*/
  ,"storage.objects.create"
  ,"storage.objects.get"
  ,"compute.networks.create"
  ,"compute.firewalls.create"
  ]
}
