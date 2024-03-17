data vsphere_datacenter "hl-01" {
  name = "hl-dc-01"
}

resource "vsphere_compute_cluster" "hl-cluster" {
  datacenter_id = data.vsphere_datacenter.hl-01.id
  name          = "hl-cluster-01"
}

resource "vsphere_host" "esxi01" {
  hostname = "10.1.2.11"
  username = var.vsphere_user
  password = var.vsphere_password
  cluster  = vsphere_compute_cluster.hl-cluster.id
}

resource "vsphere_host" "esxi02" {
  hostname = "10.1.2.12"
  username = var.vsphere_user
  password = var.vsphere_password
  cluster  = vsphere_compute_cluster.hl-cluster.id
}

resource "vsphere_host" "esxi03" {
  hostname = "10.1.2.13"
  username = var.vsphere_user
  password = var.vsphere_password
  cluster  = vsphere_compute_cluster.hl-cluster.id
}
