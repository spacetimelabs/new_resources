Cookiecutter AWS New Resources
==============================

Powered by Cookiecutter_
.. _Cookiecutter: https://github.com/audreyr/cookiecutter

Creates Terraform_ files for creating AWS Resources
.. _Terraform: https://www.terraform.io

Features
---------

* Creates IAM Role + Policy
* Creates EC2 Instance with TAGs (for the instance and volume)
* Creates userdata for the instance bootstrap


Usage
------

Inside your project's folder...

First, get Cookiecutter installed::

    $ pip install "cookiecutter>=1.4.0"

Now run it against this repo::

    $ cookiecutter https://github.com/spacetimelabs/new_resources

You'll be prompted for some values. Provide them, then the `DevOps` folder will be created for you.

Answer the prompts with your own desired information. For example::

    project_name [my_project]: MyBlog
    devops_folder [DevOps]: DevOps
    region [us-west-2]: 
    instance_name [New Instance]: MyBlog-Prod
    ami [ami-06f2f779464715dc5]: 
    instance_type [t2.medium]: t2.micro
    key_name [Master]: 
    tag_client [stl]: Internal
    tag_environment [dev]: prod
    tag_owner [dev1]: roger
    tag_product [product1]: internal

For creating the resources::

    $ cd DevOps
    $ terraform init
    $ terraform apply

**Warning**: You'll need Terraform installed and in the path before use this template. 
Check https://www.terraform.io/downloads.html out

TODO
------
- Add configuration for creating the policy file dynamically
- Add tf file for creating S3 bucket
- Add configuration for creating PROD and STAGING resources
- Add a module for split variables from template files


Any help is welcome!
Get in touch using the https://github.com/spacetimelabs/new_resources/issues
