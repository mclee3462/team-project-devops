resource "aws_instance" "app" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  user_data = <<-EOF
              yum update -y
              yum install docker -y
              service docker start
              docker run -d -p 80:5000 your-dockerhub-username/final-project:latest
              EOF

  tags = {
    Name = "DevOpsFinalProjectInstance"
  }
}
