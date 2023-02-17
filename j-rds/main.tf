provider "aws" {
  region = "eu-west-1"
}

########################################################################
# Create  RDS Instance                                                 # 
########################################################################
resource "aws_db_instance" "aws_rds" {

  multi_az                            = true # to enable database replication in different AZs

  # Setup the RDS config
}
