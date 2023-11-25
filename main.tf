/*resource "aws_s3_bucket" "example"{
 bucket ="my-tf-test-bucket-kamal"

 tags = {
    Name   ="My bucket"
    Environment ="Dev"
 }
}

data "aws_ami" "ubuntu1" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu1/images/hvm-ssd/ubuntu1-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  count=var.counter
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld-${count.index}"
  }
}

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
}*/