provider "aws" {
  region = "{{ cookiecutter.region }}"
}

{%- if cookiecutter.use_spot_instance == 'n' %}
resource "aws_instance" "{{ cookiecutter.instance_name }}" {
{%- else %}
resource "aws_spot_instance_request" "{{ cookiecutter.instance_name }}" {
{%- endif %}
  ami = "{{ cookiecutter.ami }}"
  instance_type = "{{ cookiecutter.instance_type }}"
  {%- if cookiecutter.use_spot_instance != 'n' %}spot_price = "{{ cookiecutter.spot_price }}"{%- endif %}
  key_name = "{{ cookiecutter.key_name }}"

  iam_instance_profile = "${aws_iam_instance_profile.{{ cookiecutter.project_name }}_profile.name}"
  user_data = "${file("ec2_userdata.sh")}"
  security_groups = ["Common", "SSH", "web", "default"]

  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = "{{ cookiecutter.volume_size }}"
    volume_type = "gp2"
    delete_on_termination = "true"
    encrypted = "false"
  }

  tags = {
    Name = "{{ cookiecutter.project_name }}"
    Client = "{{ cookiecutter.tag_client }}"
    Environment = "{{ cookiecutter.tag_environment }}"
    Owner = "{{ cookiecutter.tag_owner }}"
    Product = "{{ cookiecutter.tag_product }}"
  }

  volume_tags = {
    Name = "{{ cookiecutter.project_name }}"
    Client = "{{ cookiecutter.tag_client }}"
    Environment = "{{ cookiecutter.tag_environment }}"
    Owner = "{{ cookiecutter.tag_owner }}"
    Product = "{{ cookiecutter.tag_product }}"
  }
}
