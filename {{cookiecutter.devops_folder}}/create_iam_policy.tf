resource "aws_iam_policy" "policy" {
  name = "{{ cookiecutter.project_name }}-access-policy"
  description = "{{ cookiecutter.project_name }} policy"
  policy = "${file("policy_{{ cookiecutter.project_name }}_permissions.json")}"
}