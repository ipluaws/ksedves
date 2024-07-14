provider "aws" {
  region = "eu-central-1"
}

module "vpc" {
  source = "./modules/vpc"
  vpc_name                = var.vpc_name
  vpc_cidr                = var.vpc_cidr
  public_subnet_cidr_blocks  = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks = var.private_subnet_cidr_blocks
  availability_zones      = var.availability_zones
}

module "ecr" {
  source = "./modules/ecr"
  repository_name = "demo"
}

module "ecs" {
  source             = "./modules/ecs"
  cluster_name       = "demo-cluster"
  task_family        = "demo-task"
  container_image    = "654654148473.dkr.ecr.eu-central-1.amazonaws.com/demo:latest"
  service_name       = "demo-service"
  private_subnet_ids = module.vpc.private_subnet_ids
  security_group_id  = module.alb.security_group_id
  target_group_arn   = module.alb.target_group_arn
}

module "alb" {
  source           = "./modules/alb"
  vpc_id           = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_name         = "demo-alb"
  target_group_name = "demo-tg"
}

module "s3" {
  source = "./modules/s3"
  bucket_name = "sevdesk-spa-bucket"
}

module "cloudfront" {
  source              = "./modules/cloudfront"
  s3_bucket_domain_name = module.s3.bucket_domain_name
  s3_bucket_id        = module.s3.bucket_id
  alb_dns_name        = module.alb.alb_dns_name
}

