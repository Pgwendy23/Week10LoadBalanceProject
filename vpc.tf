resource "aws_vpc" "Group4Project" {
    cidr_block = "172.120.0.0/16"
    instance_tenancy = "default"

    tags = {
      Name = " GTerraform-vpc"
      env = "futureDev"
    }
  
}
resource "aws_eip" "ei1" {
  
}
#Nat gateway

resource "aws_nat_gateway" "NGW1" {
  allocation_id = aws_eip.ei1.id
  subnet_id = aws_subnet.PublicSubnet1.id
  tags = {
    Name = "Ggw NAT"
  }
  #to ensure proper ordering, it is important to add an explicity dependency
  # on the internet gateway  for the vpc
  depends_on = [ aws_internet_gateway.Group4Gateway ]
}
# public subnet
resource "aws_subnet" "PublicSubnet1" {
    availability_zone = "us-east-1a"
    cidr_block = "172.120.1.0/24"
    vpc_id = aws_vpc.Group4Project.id
    map_public_ip_on_launch = true

    tags = {
  Name = "subnet-public1-vpc"
  env = "Dev"
}
  
}
resource "aws_subnet" "PublicSubnet2" {
    availability_zone = "us-east-1b"
    cidr_block = "172.120.2.0/24"
    vpc_id = aws_vpc.Group4Project.id
    map_public_ip_on_launch = true

tags = {
  Name = "subnet-public2-vpc"
    env = "Dev"
}
  
}
# private subnet
resource "aws_subnet" "PrivateSubnet1" {
    availability_zone = "us-east-1a"
    cidr_block = "172.120.3.0/24"
    vpc_id = aws_vpc.Group4Project.id

    tags = {
  Name = "subnet-private1-vpc"
  env = "Dev"
}
 

}
resource "aws_subnet" "PrivateSubnet2" {
    availability_zone = "us-east-1b"
    cidr_block = "172.120.4.0/24"
    vpc_id = aws_vpc.Group4Project.id

      tags = {
  Name = "subnet-private2-vpc"
  env = "Dev"
}

}

# Gateway
resource "aws_internet_gateway" "Group4Gateway" {
    vpc_id = aws_vpc.Group4Project.id

    tags = {
      Name ="GTW-Group4"
    }
  
}
# Route Table 
resource "aws_route_table" "rt1" {
    vpc_id = aws_vpc.Group4Project.id
       route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Group4Gateway.id
       }
  

}
# Route Table association
resource "aws_route_table_association" "rta1" {
    subnet_id = aws_subnet.PublicSubnet1.id
    route_table_id = aws_route_table.rt1.id
  
}
resource "aws_route_table_association" "rta2" {
    subnet_id = aws_subnet.PublicSubnet2.id
    route_table_id = aws_route_table.rt1.id
  
}