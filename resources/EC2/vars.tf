variable "ec2_config" {
  type = list(
    object(
      {
        ec2_ami = string
        ec2_instance_type = string
        ec2_instance_name = string
        subnet_id = string
        ssh_key_name = string
      }
    )
  )
}
