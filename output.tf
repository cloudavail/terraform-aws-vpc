output "nat_subnets_list" {
  value = aws_subnet.nat_subnets.*.id
}

output "private_subnets_list" {
  value = aws_subnet.private_subnets.*.id
}

output "public_subnets_list" {
  value = aws_subnet.public_subnets.*.id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_route_table_id" {
  value = aws_route_table.public_subnets_route_table.id
}

output "private_route_table_id" {
  value = aws_route_table.private_subnets_route_table.id
}

output "nat_route_table_id" {
  value = aws_route_table.nat_subnets_route_table.id
}
