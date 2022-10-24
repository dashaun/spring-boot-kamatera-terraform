data "kamatera_image" "ubuntu_image" {
  datacenter_id = data.kamatera_datacenter.datacenter.id
  os            = "Ubuntu"
  code          = "22.04 64bit_optimized"
}