variable "ssh_public_key" {
  description = "SSH public key to allow access to the server without a password"
  type        = string
  nullable    = false
}

variable "ssh_private_key" {
  description = "The private key used to connect to the server without a password"
  type        = string
  nullable    = false
  sensitive   = true
}