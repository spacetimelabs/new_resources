provider "aws" {
  region = "{{ cookiecutter.region }}"
}

resource "aws_instance" "{{ cookiecutter.instance_name }}" {
  ami = "{{ cookiecutter.ami }}"
  instance_type = "{{ cookiecutter.instance_type }}"
  key_name = "{{ cookiecutter.key_name }}"

  iam_instance_profile = "${aws_iam_instance_profile.{{ cookiecutter.project_name }}_profile.name}"
  user_data = "${file("ec2_userdata.sh")}"
  security_groups = ["Common", "SSH", "web", "default"]

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
