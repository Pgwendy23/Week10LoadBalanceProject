resource "aws_security_group" "G4-lb" {
    name = "lb-sg-grp4"
    description = "Allow http"
    vpc_id = aws_vpc.Group4Project.id

    ingress {
       description = "allow http"
       from_port = 80
       to_port = 80
       protocol = "tcp"
       cidr_blocks = [ "0.0.0.0/0" ]

    }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    env = "Dev"
  }
}

resource "aws_security_group" "G4-ec2" {
    name = "web-sg-grp4"
    description = "Allow http"
    vpc_id = aws_vpc.Group4Project.id

    ingress {
       description = "allow http"
       from_port = 80
       to_port = 80
       protocol = "tcp"
       cidr_blocks = [ "0.0.0.0/0" ]

    }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [ "0.0.0.0/0" ]
  }

  tags = {
    env = "Dev"
  }
}