resource "aws_iam_user" "bucket" {
  name = "bucket-user"
  path = "/system/"

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_access_key" "bucket" {
  user = aws_iam_user.bucket.name
}

data "aws_iam_policy_document" "bucket" {
  statement {
    effect    = "Allow"
    actions   = ["s3:*"]
    resources = ["*"]
  }
}

resource "aws_iam_user_policy" "bucket" {
  name   = "test"
  user   = aws_iam_user.bucket.name
  policy = data.aws_iam_policy_document.bucket.json
}