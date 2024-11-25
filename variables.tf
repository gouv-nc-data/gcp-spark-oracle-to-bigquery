variable "project_id" {
  type        = string
  description = "id du projet"
}

variable "region" {
  type    = string
  default = "europe-west1"
}

variable "group_name" {
  type        = string
  description = "Google groupe associé au projet"
}

variable "schedule" {
  type        = string
  description = "expression cron de schedule du job"
}

variable "jdbc-url-secret-name" {
  type        = string
  description = "nom du secret contenant l'url de connexion jdbc à la BDD"
}

variable "dataset_name" {
  type        = string
  description = "nom du projet"
}

variable "notification_channels" {
  type        = list(string)
  description = "canal de notification pour les alertes sur dataproc"
}

variable "schema" {
  type        = string
  description = "schema contenant les tables à migrer"
}

variable "exclude" {
  type        = string
  description = "liste des tables à ne pas migrer"
  default     = ""
}

variable "mode" {
  type        = string
  description = "type d'upload sur bigquery"
  default     = "overwrite"
}

variable "ttl" {
  type        = string
  description = "Durée maximum d'un job en seconde, https://cloud.google.com/dataproc-serverless/docs/quickstarts/spark-batch?hl=fr#dataproc_serverless_create_batch_workload-api"
  default     = "14400s"
}

variable "jdbc_driver" {
  type        = string
  description = "fichier jar de drivers jdbc"
  default     = "ojdbc8-21.7.0.0.jar"
}
