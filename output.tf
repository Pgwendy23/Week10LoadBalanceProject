output "vpc_id" {
    value = aws_vpc.Group4Project.id
  
}
output "ec2_security_group" {
    value = aws_security_group.G4-ec2.id
  
}
output "lb_security_group" {
    value = aws_security_group.G4-lb.id
  
}

  
output "ec2_instance1" {
    value = aws_instance.ec2-1.id
  
}
output "ec2_instance2" {
    value = aws_instance.ec2-2.id
  
}
output "PublicSubnet1" {
    value = aws_subnet.PublicSubnet1.id
  
}
output "PublicSubnet2" {
    value = aws_subnet.PublicSubnet2.id
  
}
output "PrivateSubnet1" {
    value = aws_subnet.PrivateSubnet1.id
  
}
output "PrivateSubnet2" {
    value = aws_subnet.PrivateSubnet2.id
  
}