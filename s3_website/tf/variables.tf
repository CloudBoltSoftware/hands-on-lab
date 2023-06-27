variable "owner" {
  description = "Owner of the website"
  type = string
}

variable "group" {
  description = "Name of the Group deploying the Website"
  type = string
}

variable "bucket_name" {
  description = "Bucket Name"
  type = string
}

variable "map_test" {
  type = map
  default = {
    tag1 = "value1"
    tag2 = "value2"
  }
}