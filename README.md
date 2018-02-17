# AWS lambda packager 

Packages your python lambdas.

## Usage

Run the container like this to create a zip file for uploading to AWS lambda:

```bash
docker run \
    -u "${EUID}" \       # <-- this makes sure the resulting zip file is owned by you (and not by root)
    -v ${PWD}:/workdir \ # <-- this mounts your aws credentials inside the container's home dir
    felixb/aws-lambda-packager
```

## Configuration

Set `LAMBDA_NAME` environment variable to configure your output file name like this:

```bash
docker run -e LAMBDA_NAME=some-lambda ...
```

## Requirements

* Your python code is located in your current working directory
* There is a requirements.txt file in your current working directory
 