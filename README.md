# gcp-spark-oracle-to-bigquery

Permet de faire un equivalent de "select *" de chaque table oracle on premise et crée une table du même nom sur BQ.

url format : 

jdbc:oracle:thin:user/pw@url:port:instance v12 
jdbc:oracle:thin:user/pw@url:port/instance v2x

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_cloud_scheduler_job.job](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloud_scheduler_job) | resource |
| [google_monitoring_alert_policy.errors](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/monitoring_alert_policy) | resource |
| [google_project_iam_custom_role.dataproc-custom-role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_project_iam_member.bigquery_editor_bindings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.bigquery_user_bindings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.cloud_scheduler_runner_bindings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.dataflow_custom_worker_bindings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.dataflow_developer_bindings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.dataflow_worker_bindings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_iam_member.storage_admin_bindings](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_project_service.cloudschedulerapi](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.dataprocrapi](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_project_service.secretmanagerapi](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_service) | resource |
| [google_service_account.service_account](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account) | resource |
| [google_service_account_iam_member.gce-default-account-iam](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/service_account_iam_member) | resource |
| [google_storage_bucket.dataproc_staging_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [google_storage_bucket_iam_member.access_to_script](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_storage_bucket_iam_member.access_to_temp_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket_iam_member) | resource |
| [google_secret_manager_secret_version.jdbc-url-secret](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/secret_manager_secret_version) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dataset_name"></a> [dataset\_name](#input\_dataset\_name) | nom du projet | `string` | n/a | yes |
| <a name="input_exclude"></a> [exclude](#input\_exclude) | liste des tables à ne pas migrer | `string` | `""` | no |
| <a name="input_generation_id"></a> [generation\_id](#input\_generation\_id) | generation id du fichier dans le bucket | `string` | `""` | no |
| <a name="input_group_name"></a> [group\_name](#input\_group\_name) | Google groupe associé au projet | `string` | n/a | yes |
| <a name="input_jdbc-url-secret-name"></a> [jdbc-url-secret-name](#input\_jdbc-url-secret-name) | nom du secret contenant l'url de connexion jdbc à la BDD | `string` | n/a | yes |
| <a name="input_jdbc_driver"></a> [jdbc\_driver](#input\_jdbc\_driver) | fichier jar de drivers jdbc | `string` | `"ojdbc8-21.7.0.0.jar"` | no |
| <a name="input_mode"></a> [mode](#input\_mode) | type d'upload sur bigquery | `string` | `"overwrite"` | no |
| <a name="input_notification_channels"></a> [notification\_channels](#input\_notification\_channels) | canal de notification pour les alertes sur dataproc | `list(string)` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | id du projet | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"europe-west1"` | no |
| <a name="input_schedule"></a> [schedule](#input\_schedule) | expression cron de schedule du job | `string` | n/a | yes |
| <a name="input_schema"></a> [schema](#input\_schema) | schema contenant les tables à migrer | `string` | n/a | yes |
| <a name="input_subnetwork_name"></a> [subnetwork\_name](#input\_subnetwork\_name) | subnetwork du job | `string` | `"subnet-for-vpn"` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | Durée maximum d'un job en seconde, https://cloud.google.com/dataproc-serverless/docs/quickstarts/spark-batch?hl=fr#dataproc_serverless_create_batch_workload-api | `string` | `"14400s"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->