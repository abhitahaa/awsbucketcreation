### Creation of Zip of Python Application ###

data "archive_file" "zip_the_python_code" {
type        = "zip"
source_dir  = "${path.module}/python/"
output_path = "${path.module}/python/lambda.zip"
}


### Add aws_lambda_function Function ###

resource "aws_lambda_function" "terraform_lambda_func" {
filename                       = "${path.module}/python/lambda.zip"
function_name                  = "Automate_next_Lambda_Function"
role                           = aws_iam_role.lambda_role.arn
handler                        = "index.lambda_handler"
runtime                        = "python3.8"
depends_on                     = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}




# lambda function name: ProbPred_AN
# file: lambda_function.py
# test event action: private
# lambda function doest have permission to write to amazon cloudwatch logs
# Role name: LambdaToS3Role
# LambdaToS3PolicyAN

# {
#     "Version" : "2012-10-17",
#     "Statement" : [
#         {
#             "Sid" : "VisualEditor0",
#             "Effect" : "Allow",
#             "Action" : "s3.GetObject",
#             "Resource" : "arn:aws:S3:::automatenext-input-data/*"
#         }
#     ]
# }

# Allowed Services 
# Amazon S3 > Policy Granting permission LambdaToS3PolicyAN
