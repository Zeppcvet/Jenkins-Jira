provider "aws" {
  access_key = "AKIAUUW5KYXOLN742XMQ"
  secret_key = "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"
  region = "eu-central-1"
}


resource "aws_instance" "Jenkins" {
  ami = "ami-0767046d1677be5a0"
  instance_type = "t2.micro"
  tags = {name = "Jenkins"}
  user_data = file("jenkins.sh")
  key_name = "MyJenkinsKey"
}


resource "aws_instance" "Jira"{
ami = "ami-0767046d1677be5a0"
instance_type = "t2.micro"
tags = {name = "Jira"}
#user_data = file("Jira.sh")
key_name = "MyJenkinsKey"

}
