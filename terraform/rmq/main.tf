provider "aws"{
    region = "us-east-1"
    profile=var.profile
}

resource "aws_instance" "rmq" {
    ami = "ami-047a51fa27710816e"
    instance_type = "t2.micro"
    key_name = "rabbitmq"
    vpc_security_group_ids = [ "sg-01b0a50a79dc4ba55" ]

    tags = {
        Name = var.name
        group = var.group
    }
}

output "instance_ip" {
  value = aws_instance.rmq.public_ip
}
