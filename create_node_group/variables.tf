variable "node_group_name" {
  type = string
}

variable "ssh_key" {
  type    = string
}

variable "instance_types" {
  type = list(string)
}

variable "labels" {
  type = map(string)
}

variable "desired_size" {
  type    = number
  default = 3
}

variable "max_size" {
  type    = number
  default = 3
}

variable "min_size" {
  type    = number
  default = 2
}
