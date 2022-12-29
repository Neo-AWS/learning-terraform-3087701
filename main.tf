data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ami_0b5eea76982371e91_64_bit_x86"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["979382823631"] # Bitnami
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.app_ami.id
  instance_type = var.instance_type
  tags = {
    Name = "HelloWorld"
  }
}
