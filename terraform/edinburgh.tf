# Kubernetes workers
module "edi-master-1" {
  name           = "edi-master-1"
  source         = "./modules/rhel8"
  tags           = ["base", "kubernetes_worker", "kubernetes_master"]
  ip             = "192.168.2.20"
  gateway        = "192.168.2.1"
  ansible_id_rsa = var.ansible_id_rsa
  providers      = {
    proxmox = proxmox.edi-s-01
  }
  target_node = "edi-s-01"
  source_vm   = "edi-s-01-template"
  desc        = "Kubernetes master node in Edinburgh"
}
module "edi-kubeworker-1" {
  name           = "edi-kubeworker-1"
  source         = "./modules/rhel8"
  tags           = ["base", "kubernetes_worker"]
  ip             = "192.168.2.21"
  gateway        = "192.168.2.1"
  ansible_id_rsa = var.ansible_id_rsa
  providers      = {
    proxmox = proxmox.edi-s-01
  }
  target_node = "edi-s-01"
  source_vm   = "edi-s-01-template"
  desc        = "Kubernetes worker node in Edinburgh"
}
module "edi-kubeworker-2" {
  name           = "edi-kubeworker-2"
  source         = "./modules/rhel8"
  tags           = ["base", "kubernetes_worker"]
  ip             = "192.168.2.22"
  gateway        = "192.168.2.1"
  ansible_id_rsa = var.ansible_id_rsa
  providers      = {
    proxmox = proxmox.edi-s-01
  }
  target_node = "edi-s-01"
  source_vm   = "edi-s-01-template"
  desc        = "Kubernetes worker node in Edinburgh"
}
module "edi-kubeworker-3" {
  name           = "edi-kubeworker-3"
  source         = "./modules/rhel8"
  tags           = ["base", "kubernetes_worker"]
  ip             = "192.168.2.23"
  gateway        = "192.168.2.1"
  ansible_id_rsa = var.ansible_id_rsa
  providers      = {
    proxmox = proxmox.edi-s-01
  }
  target_node = "edi-s-01"
  source_vm   = "edi-s-01-template"
  desc        = "Kubernetes worker node in Edinburgh"
}

# Github runners
module "edi-runner-1" {
  name           = "edi-runner-01"
  source         = "./modules/rhel8"
  tags           = ["base", "github_runner"]
  ip             = "192.168.2.31"
  gateway        = "192.168.2.1"
  ansible_id_rsa = var.ansible_id_rsa
  providers      = {
    proxmox = proxmox.edi-s-01
  }
  target_node = "edi-s-01"
  source_vm   = "edi-s-01-template"
  desc        = "GitHub runner node in Edinburgh"
}

# NFS Servers
module "edi-nfs-1" {
  name           = "edi-nfs-1"
  source         = "./modules/rhel8"
  tags           = ["base", "nfs_server"]
  ip             = "192.168.2.41"
  gateway        = "192.168.2.1"
  ansible_id_rsa = var.ansible_id_rsa
  providers      = {
    proxmox = proxmox.edi-s-01
  }
  target_node = "edi-s-01"
  source_vm   = "edi-s-01-template"
  desc        = "NFS server in Edinburgh"

  disks = [
    {
      size    = "32G"
      storage = "local-lvm"
      type    = "scsi"
    },
    {
      size    = "3000G"
      storage = "edi-s-01-data"
      type    = "scsi"
    }
  ]
}