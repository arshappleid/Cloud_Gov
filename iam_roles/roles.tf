resource "aws_iam_role" "role_example_1" {
  name = "my_example_role_1"
  assume_role_policy = file("${path.module}/policy_example_1.json")
}

resource "aws_iam_role" "role_example_2" {
  name = "my_example_role_2"
  assume_role_policy = file("${path.module}/policy_example_2.json")
}
