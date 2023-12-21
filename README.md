# simple_app

#### Pre-requisites
1. `AWS CLI` & `eksctl` installed on your PC/VM

#### Steps
1. Setup the AWS credentials for the AWS account
2. Initiallite and apply the terraform configuration from /terraform folder
3. Once deployed, configure the Kubernetes CLI to use the cluster's context:
```
aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)

kubectl cluster-info
```

NOTE: Adjust the SG on EC2s to allow incoming traffic on port 3000 from the ALB /to be added in the TF configuration/

4. Continuous Deployment setup:
- Update following secrets in GitHub repository:
-- AWS_ACCESS_KEY_ID
-- AWS_SECRET_ACCESS_KEY
-- KUBE_CLUSTER_NAME
- If needed update following values in the Action:
-- KUBE_NAMESPACE
-- HELM_RELEASE_NAME