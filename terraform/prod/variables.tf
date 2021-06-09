variable cloud_id {
  description = "b1glddctp0k8gjhs675k"
}
variable folder_id {
  description = "b1g760ma93anl4hri4jp"
}
variable zone {
  description = "Zone"
  default     = "ru-central1-a"
}
variable public_key_path {
  description = "~/.ssh/ubuntu.pub"
}
variable private_key_path {
  description = "~/.ssh/ubuntu"
}
variable image_id {
  description = "fd8jcdn7606gtc3hhm79"
}
variable subnet_id {
  description = "e9bgianfsqln13nf5ou7"
}
variable service_account_key_file {
  description = "../key.json"
}
variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-app-base"
}
variable db_disk_image {
  description = "Disk image for reddit db"
  default = "reddit-db-base"
}
