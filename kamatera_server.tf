# this defines the server resource with most configuration options
resource "kamatera_server" "my_server" {
  name          = "bootiful${formatdate("DD_MMM_YYYY_hh_mm_ZZZ", timestamp())}"
  datacenter_id = data.kamatera_datacenter.datacenter.id
  cpu_type      = "A"
  cpu_cores     = 1
  ram_mb        = 2048
  disk_sizes_gb = [20]
  billing_cycle = "hourly"
  image_id      = data.kamatera_image.my_image.id
  ssh_pubkey    = var.ssh_public_key

  connection {
    type        = "ssh"
    user        = "root"
    private_key = var.ssh_private_key
    host        = self.public_ips[0]
    timeout     = "2m"
  }

  provisioner "remote-exec" {
    inline = [
      "set -o errexit",
      "curl -fsSL https://get.docker.com -o get-docker.sh",
      "sh get-docker.sh",
      "docker run --name bootiful --rm -d -p 8080:8080 dashaun/spring-boot-native-pi-default:latest"
    ]
  }
}