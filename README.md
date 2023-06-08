# tf-aws-template

## Description

This repository is a template to create other Terraform AWS repositories following some standard best practices.

## Expected files

The following files are expected:

* `main.tf`
* `variables.tf`
* `outputs.tf`
* `terraform.tfvars.example`
* `.tflint.hcl`
    * [GitHub page](https://github.com/terraform-linters/tflint)

The section below details the actual template for the README:

# tf-aws-lowercase-name

## Description

Provide a short description of the module.

## Interaction

Quick notes and reference on how to begin interacting with the resources can be added here.

## Timing

Creation time: ? minutes

Destruction time: ? minutes

## Notes

Any miscellaneous points or interesting observations can be added here.

## Troubleshooting & debugging

General troubleshooting guide information should be added here.

### cloud-init troubleshooting

* Cloud-init executes scripts in alphabetical order
    * For simplicity, label the created scripts with numbers according to execution order
    * Take note that this is related to how cloud-init works specifically and even the content type can also affect the execution order
* Note that you need sudo permissions
* Find the logs in `/var/log`, specifically `/var/log/cloud-init-output.log`
* Find the scripts in `/var/lib/cloud/instance/scripts`

### Issue 1

Info and solutions (if any) for specific issues should have their own dedicated section.

## To-do list

* Bulleted list of items that could be worked on.

## Requirements

To easily generate out the list of requirements, outputs, etc, use [terraform-docs](https://github.com/terraform-docs/terraform-docs) to create the documentation: `terraform-docs markdown --output-file README.md .`
...
