variable "region" {
  description = "Region to deploy resources in"
  default     = "us-east-1"
}
variable "zone1" {
  description = "Availability Zone 1"
  default     = "us-east-1a"
}

variable "zone2" {
  description = "Availability Zone 2"
  default     = "us-east-1b"
}

variable "zone3" {
  description = "Availability Zone 3"
  default     = "us-east-1c"
}
variable "amiID" {
  type        = map(any)
  description = "value of amiID"
  default = {
    "us-east-1" = "ami-020cba7c55df1f615"
    "us-east-2" = "ami-058a8a5ab36292159"
  }
}
variable "webuser" {
  default = "ubuntu"
}
