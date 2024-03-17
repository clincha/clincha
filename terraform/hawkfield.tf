data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}

data "vsphere_host" "host" {
  count         = length(var.hosts)
  name          = var.hosts[count.index]
  username      = var.vsphere_user
  password      = var.vsphere_password
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

resource "vsphere_compute_cluster" "compute_cluster" {
  name            = "terraform-compute-cluster-test"
  datacenter_id   = data.vsphere_datacenter.datacenter.id
  host_system_ids = [data.vsphere_host.host.*.id]
}

variable "datacenter" {
  default = "hl-01"
}

variable "hosts" {
  default = [
    "10.1.2.11",
    "10.1.2.12",
    "10.1.2.13",
  ]
}