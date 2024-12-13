# Joke Fetcher
This application is a Python-based service that fetches random jokes every 5 minutes and logs them. It is designed to be deployed on Kubernetes and demonstrates the full development and deployment lifecycle, including containerization, orchestration, and logging.
  

## Requirements
- Docker
- Kubernetes
- Helm
- Terraform
- Python 3.9 or higher
  

## Setup
1. Clone the repository
```
git clone https://github.com/the-archbishop/joke-fetcher.git
cd joke-fetcher
```

2. Build the docker image
```
docker build -t joke-fetcher .
```

3. Deploy via Terraform
```
cd terraform
terraform init
terraform apply
```

4. Verify the deployment
```
kubectl get pods -n joke-fetcher
```

5. Stream logs

```
kubectl logs -n joke-fetcher -l app=joke-fetcher --tail=100 -f
```
  

### Example Log Output
```
2024-12-12 19:06:47,811 - START: joke fetcher
2024-12-12 19:06:47,811 - HEALTH CHECK: Successfully wrote to /tmp/healthy
2024-12-12 19:06:47,964 - Here's one for ya...
2024-12-12 19:06:47,964 - What do you do when you see a space man? ... Park your car, man.
2024-12-12 19:06:47,965 - SLEEP: 5 minutes
2024-12-12 19:07:17,811 - HEALTH CHECK: Successfully wrote to /tmp/healthy
...
2024-12-12 19:11:48,055 - HEALTH CHECK: Successfully wrote to /tmp/healthy
2024-12-12 19:11:48,179 - Here's one for ya...
2024-12-12 19:11:48,179 - What did the mountain climber name his son? ... Cliff.
2024-12-12 19:11:48,179 - SLEEP: 5 minutes
2024-12-12 19:12:18,085 - HEALTH CHECK: Successfully wrote to /tmp/healthy
```
