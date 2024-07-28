variable "tags" {
  type = map(string)
  default = {
    "Name" = "Demo EC2"
  }
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "region" {
  type    = string
  default = "eu-west-1"
}