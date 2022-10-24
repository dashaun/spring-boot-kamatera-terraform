output "public_ips" {
  value = kamatera_server.my_server.public_ips[0]
}