resource "aws_iam_policy_attachment" "{{ cookiecutter.project_name }}-iam-attach" {
  name = "{{ cookiecutter.project_name }}-iam-attach"
  roles = ["${aws_iam_role.ec2_{{ cookiecutter.project_name }}_access_role.name}"]
  policy_arn = "${aws_iam_policy.policy.arn}"
}