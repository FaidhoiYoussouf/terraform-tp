# outputs.tf - Fichier des sorties Terraform

output "instance_ip" {
  description = "IP publique simulée"
  value = "192.168.1.100"
}

output "vpc_id" {
  description = "ID du VPC simulé"
  value = "vpc-12345"
}

output "subnet_id" {
  description = "ID du sous-réseau simulé"
  value = "subnet-67890"
}

output "test_output" {
  description = "Test pour la Pull Request"
  value = "Ceci est un test"
}