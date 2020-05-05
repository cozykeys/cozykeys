# CozyKeys

This repository contains the source for the CozyKeys.xyz website.

## Running Locally

```bash
hugo server -D
```

## Deployment

First, make sure you've cloned the repository with submodules recursively:
```bash
git clone --recurse-submodules git://github.com/cozykeys/cozykeys.git
```

After making updates, run the deployment script which will automatically commit
and push changes to the GitHub pages repository:
```bash
./deploy.sh
```
