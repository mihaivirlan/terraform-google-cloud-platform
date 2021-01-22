### Firstly you need have installed terraform and git, for this you access the following links that will help you do that <br />
https://learn.hashicorp.com/tutorials/terraform/install-cli <br />
https://www.linode.com/docs/guides/how-to-install-git-on-linux-mac-and-windows/

### Go in your Google Cloud Platform console (GCP)
https://console.cloud.google.com

### In GCP console (in your choosed project), go in APIs & Services and check if you have enabled follow api's, if don't have enabled, do this: <br />
Compute Engine API <br />
IAM Service Account Credentials API <br />
Identity and Access Management (IAM) API <br />

### In GCP console, go in IAM & Admin
Here create a test service account, named for example - terraform-test-gcp <br />
After created the test service account, we must allocate the follow roles to this new test created account: <br />
Compute Engine -> Compute Admin <br />
Compute Engine -> Compute Network Admin <br />
Project -> Editor

### In IAM & Admin click to Service Accounts option
Here click the three-point option next to your test service account and choose the option -> Create key -> choose the JSON format key -> after that the key must be downloaded to your local machine. <br />

### On your local machine go to your work dir
cd /home/your_username/your_work_dir <br />
Copy+paste+enter follow command: <br />
git clone https://github.com/mihaivirlan/terraform-google-cloud-platform.git <br />
cd ~/terraform-google-cloud-platform <br />
ls -la

### Open the local new cloned repo with your prefered editor
In this repo should have two files: <br />
.gitignore <br />
main.tf <br />
In this repo/dir you must move your JSON file downloaded above from GCP.
Rename your JSON for example as -> service-account.json <br />

### Now in your repo/dir should have three files: 
service-account.json <br />
main.tf <br />
.gitignore

### Open the main.tf file
Change in this file the values for next variables with your values: <br />
credentials = "${file("your_file.json")}" <br />
project = "your_project_name_in_gcp"

### From your local repo/dir open the terminal/shell/editor terminal and run:
terraform init <br />
terraform plan <br />

### After terraform plan running successfully, run:
terraform apply

### After terraform apply running successfully, check in your GCP console from Menu, the section Compute Engine, and there you have to see the VM created, so check any type of resource like - VPN Network or Kubernetes Engine, etc....

### To destroy created resources from GCP, run:
terraform destroy <br />

And check again in the GCP console the certain resource, and should see that this/these resource(s) declared in main.tf file, was deleted/removed