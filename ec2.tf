data "aws_security_group" "existing_sg" {
  filter {
    name   = "group-name"
    values = ["oneforall"]   #for exesting security group
  }
}

resource "aws_instance" "ec2-prod" {
  count = 2 # Will create 2 machines,
  ami           = "ami-04b4f1a9cf54c11d0"
  instance_type = "t3.medium"
  key_name      = "jenkins-master"   # Name of the existing key pair in AWS

  vpc_security_group_ids = [data.aws_security_group.existing_sg.id]

  tags = {
    Name = "k8s_docker_jenkins_master"
  }
}