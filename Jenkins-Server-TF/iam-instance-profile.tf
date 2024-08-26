resource "aws_iam_instance_profile" "instance-profile" {
  name = "DevSecProject"
  role = aws_iam_role.iam-role.name
}