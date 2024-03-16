#ASG
resource "aws_launch_template" "my-wp-lt" {
    name_prefix = var.launch_temp_name
    image_id = "ami-0787f41e75beed382"
    instance_type = "t3a.small" 
}

resource "aws_autoscaling_group" "my-wp-asg" {
  availability_zones = ["ap-south-1b", "ap-south-1a"]
  desired_capacity   = 0
  max_size           = 0
  min_size           = 0

  launch_template {
    id      = aws_launch_template.my-wp-lt.id
    version = "$Latest"
  }
}