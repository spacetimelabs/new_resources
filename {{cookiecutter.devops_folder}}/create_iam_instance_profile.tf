resource "aws_iam_instance_profile" "{{ cookiecutter.project_name }}_profile" {
  name = "{{ cookiecutter.project_name }}_profile"
  roles = ["${aws_iam_role.ec2_{{ cookiecutter.project_name }}_access_role.name}"]
}

resource "aws_iam_role" "ec2_{{ cookiecutter.project_name }}_access_role" {
  name = "{{ cookiecutter.project_name }}-access-role"
  assume_role_policy = "${file("assumerolepolicy.json")}"
}