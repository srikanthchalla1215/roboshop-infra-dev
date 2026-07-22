module "vpc" {
    source = "git::https://github.com/srikanthchalla1215/terraform-aws-vpc.git?ref=main"
    project = var.project
    environment = var.environment
}