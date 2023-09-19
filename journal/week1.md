# Terraform Beginner Bootcamp 2023 . Week 1
## Root Module Structure
Our root structure is as follows:
```
PROJECT_ROOT
|-- main.tf             # Everything else
|-- variables.tf        # Store the structure of input variables
|-- terraform.tfvars    # The data of variables we want to load into our Terraform project
|-- providers.tf        # Define required providers and configuration
|-- outputs.tf          # Store our outputs
|-- README.md           # Required for root modules

```

https://developer.hashicorp.com/terraform/language/modules/develop/structure  
