# aws-terraform-eks
Create EKS cluster from scratch.

Create the cluster:

Note: You need to create your own backend for the tfstate file.
Repalce the `backend.tf` file with yours.

Also make sure your aws cli credentials have the permissions for the EKS cluster.

```
git clone https://github.com/danfmihai/aws-terraform-eks.git
cd aws-terraform-eks

terraform init
terraform apply

```

## Summary
This creates:
- VPC
- internet-gateway
- 2 public subnets (load balancer)
- 2 private subnets (for the workers)
- 2 nat gateways for the private subnets to access the internet
- elastic IPs for each NAT gateways
- 3 routing tables (1 for public, 2 for private)
- EKS cluster 
- EKS node(s) - using t2.micro and SPOT instances
- add label to the node(s) "role" = "nodes-general"


To be able to connect to the Cluster issue the following command:

`aws eks --region us-east-1 update-kubeconfig --name my-eks-cluster --profile <yourprofilename>`

it will change the context to the new EKS cluster.


## Troubleshooting
If you get the error: "error: You must be logged in to the server (Unauthorized)":

You need to use the same user credentials to access th cluster when you created it with Terraform or have the user who created the cluster add you as a user with permissions.

Find more details here:
https://aws.amazon.com/premiumsupport/knowledge-center/eks-api-server-unauthorized-error/

## Load Balancer
In the testing app which is just a webserver/nginx is created a NLB

For the Network Load Balancer check references:
https://docs.aws.amazon.com/eks/latest/userguide/network-load-balancing.html#network-load-balancing-service-sample-manifest
https://kubernetes.io/docs/concepts/services-networking/service/#loadbalancer


