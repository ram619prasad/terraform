output "web_server" {
  value = {
    for ec2 in aws_instance.web_server : "config" => {
      arn = ec2["arn"]
      public_ip = ec2["public_ip"]
      private_ip = ec2["private_ip"] 
      instance_state = ec2["instance_state"]
      tags = ec2["tags"]
      key_name = ec2["key_name"]
    }
  }
}

output "elastic_ips" {
  value = {
    for eip in aws_eip.web_server_eip : "config" => {
      public_ip = eip["public_ip"]
      instance = eip["instance"]
    }
  }
}