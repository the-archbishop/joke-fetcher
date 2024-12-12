# Joke Fetcher
This application is a Python-based service that fetches random jokes every 5 minutes and logs them. It is designed to be deployed on Kubernetes and demonstrates the full development and deployment lifecycle, including containerization, orchestration, and logging.
  

## Requirements
- Docker
- Kubernetes
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
2024-12-12 16:33:09,312 - START: joke fetcher

2024-12-12 16:33:09,466 - Here's one for ya...

2024-12-12 16:33:09,466 - I can't tell if i like this blender... ... It keeps giving me mixed results.

2024-12-12 16:33:09,466 - SLEEP: 5 mintues

2024-12-12 16:38:09,708 - Here's one for ya...

2024-12-12 16:38:09,708 - Why did the octopus beat the shark in a fight? ... Because it was well armed.

2024-12-12 16:38:09,708 - SLEEP: 5 mintues
```
