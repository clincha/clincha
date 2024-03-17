terraform {
  required_providers {
    vsphere = {
      source  = "hashicorp/vsphere"
      version = "2.7.0"
    }
  }
}

provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_user
  password             = var.vsphere_password
  allow_unverified_ssl = true
}

variable "vsphere_server" {
  type    = string
  default = "10.1.2.12"
}

variable "vsphere_user" {
  type    = string
  default = "root"
}

variable "vsphere_password" {
  type      = string
  sensitive = true
}