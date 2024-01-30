resource "proxmox_vm_qemu" "rocky8" {
  name        = var.name
  desc        = var.desc
  target_node = var.target_node
  clone       = var.source_vm
  full_clone  = var.full_clone
  agent       = var.agent
  onboot      = var.onboot
  numa        = var.numa
  hotplug     = var.hotplug
  scsihw      = var.scsihw

  sockets = var.sockets
  cores   = var.cores
  memory  = var.memory

  os_type   = var.os_type
  cloudinit_cdrom_storage = "ssd"
  bootdisk = "virtio0"

  ciuser = "ansible"
  sshkeys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICDMAJMgmScKdlNtaIUHdCZ85cx76MVe1iUJwiU0/NyM ansible@clincha.co.uk"
  ipconfig0 = "ip=${ var.ip }/${ var.subnet_mask },gw=${ var.gateway }"

  tags = join(",", var.tags)

  disks {
    virtio {
      virtio0 {
        disk {
          size = 32
          storage = "ssd"
        }
      }
    }
  }

  dynamic "network" {
    for_each = var.networks
    content {
      bridge    = network.value.bridge
      firewall  = network.value.firewall
      link_down = network.value.link_down
      model     = network.value.model
    }
  }

  provisioner "remote-exec" {
    connection {
      host        = var.ip
      type        = "ssh"
      user        = var.connection_user
      private_key = var.ansible_id_rsa
      port        = var.port
    }

    inline = ["sudo hostnamectl set-hostname ${ var.name }"]
  }

}
