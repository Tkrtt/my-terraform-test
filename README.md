## Summary
My Terraform test.

<hr>

## Requirements

| Requirement  | Description                                                  |
| ------------ | ------------------------------------------------------------ |
| `terraform`  | Used for creating the environment                            |
| `vault`      | Used for storing secrets                                     |
| `aws-cli`    | Used for authentication to AWS                               |

<hr>

## How to use

1. Configuration
    ```
    Create a file named "test.tfvars" from the example in ./vars/tfvars
    Change userdata.tpl for your liking
    ```
2. Create the environment
    ```bash                 
    terraform apply --var-file="vars/test.tfvars"
    ```

    
<hr>

## WIP

    Fixing vault stuff. Plain text secrets are no good.

<hr>