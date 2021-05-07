resource "tls_private_key" "ssh" {
  algorithm    = "RSA"
  rsa_bits     = "2048"
}

# Save private key file to local
resource "local_file" "private_key" {
  count        = var.public_ssh_key == "" ? 1 : 0
  content      = tls_private_key.ssh.private_key_pem
  filename     = "./creds/private_ssh_key"
}