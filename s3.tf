resource "aws_s3_bucket" "test" {
  bucket = "abhitahaa-tf-test-bucket-test" #automatenext-input-data

  tags = {
    Name        = "My bucket"
    Environment = var.env[0]
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.test.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "versioning_test" {

    bucket = aws_s3_bucket.test.id
    versioning_configuration {
    status = "Disabled"

    }
}


resource "aws_s3_object" "example" {
  bucket = aws_s3_bucket_versioning.versioning_test   #automatenext-input-data/final-json-output/entity_based_files/*.json
  key    = "droeloe"
  source = "example.txt"
}


# Bucket Properties > bucket versioning>disabled. multi factor authentication > disabled. keys >project:automate_next
# default encription> disabled. 
# Server access loggin > disabled
# aws cloud trail data evens > disabledata 
# eventbridge >disabled
# object lock> disabled requester pays > disabled 

# Properties> block public access > on 
# bucket poliy public access is blocked because block public access settings are turned on '
# no lifecycle or replication rules
# no access point. 
