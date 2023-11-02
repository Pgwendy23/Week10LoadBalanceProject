resource "aws_instance" "ec2-1" {
  ami = "ami-01eccbf80522b562b"
  vpc_security_group_ids = [ aws_security_group.G4-ec2.id ]
  subnet_id = aws_subnet.PrivateSubnet1.id
  user_data = file("userdata.sh")
  instance_type = "t2.micro"

  tags = {
    Name = "G4webserver1"
  }
}

resource "aws_instance" "ec2-2" {
  ami = "ami-01eccbf80522b562b"
  vpc_security_group_ids = [ aws_security_group.G4-ec2.id ]
  subnet_id = aws_subnet.PrivateSubnet2.id
  user_data = file("userdata.sh")
  instance_type = "t2.micro"

  tags = {
    Name = "G4webserver2"
  }
}