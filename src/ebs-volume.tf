
# this resource will create a ebs volume with 1 gb in size,
# we are creating this volume for persistant storage of critical data
resource "aws_ebs_volume" "ebs_volume" {
  availability_zone = aws_instance.api_host.availability_zone
  size              = 1
  tags = {
    Name = "ebsVolume"
  }
}

# this will attach above created volume to ec2 instance at /dev/sdf
resource "aws_volume_attachment" "attach_volume" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.ebs_volume.id
  instance_id = aws_instance.api_host.id
  
  force_detach = false                           
}