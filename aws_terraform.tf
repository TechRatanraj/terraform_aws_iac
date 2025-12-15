
data "aws_vpc" "default" {
  default = true
}

resource "aws_subnet" "default_subnet" {
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = "172.31.1.0/24"  # MUST be inside VPC CIDR
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
}

resource "aws_instance" "example" {
  ami           = "ami-0ecb62995f68bb549"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.default_subnet.id
}
