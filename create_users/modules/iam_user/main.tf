# Create IAM user
resource "aws_iam_user" "terraform_iam_user" {
  name = var.user_name
  tags = {
    Project = var.project_name
  }
}

# Create access and secret keys for user
resource "aws_iam_access_key" "terraform_iam_user_access_key" {
  user = aws_iam_user.terraform_iam_user.name
}