#resource "vsphere_compute_cluster" "hl-cluster" {
#  datacenter_id = data.vsphere_datacenter.hl-01.id
#  name          = "hl-cluster-01"
#}

resource "vsphere_host" "esxi01" {
  hostname = "10.1.2.11"
  username = var.vsphere_user
  password = var.vsphere_password
  #  cluster  = vsphere_compute_cluster.hl-cluster.id
  license  = vsphere_license.vmug.id
}

resource "vsphere_host" "esxi02" {
  hostname = "10.1.2.12"
  username = var.vsphere_user
  password = var.vsphere_password
  #  cluster  = vsphere_compute_cluster.hl-cluster.id
  license  = vsphere_license.vmug.id
}

resource "vsphere_host" "esxi03" {
  hostname = "10.1.2.13"
  username = var.vsphere_user
  password = var.vsphere_password
  #  cluster  = vsphere_compute_cluster.hl-cluster.id
  license  = vsphere_license.vmug.id
}

resource "vsphere_license" "vmug" {
  license_key = var.licence_key
}

resource "vsphere_datacenter" "hl-dc" {
  name = "hawkfield_lodge"

}

variable "licence_key" {
  description = "The license key to use for the ESXi hosts"
  type        = string
  sensitive   = true
}