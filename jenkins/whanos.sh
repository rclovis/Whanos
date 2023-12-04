#!/usr/bin/env bash

# This script handles comprehension of the repository and treating the data
# It is executed by jenkins' job seed for creating a new job for each newly tracked repository

find_languages() {
    languages=()
    if [[ -f Makefile ]]; then
        languages+=("c")
    elif [[ -f pom.xml ]]; then
        languages+=("java")
    elif [[ -f package.json ]]; then
        languages+=("javascript")
    elif [[ -f requirements.txt ]]; then
        languages+=("python")
    elif [[ -f main/main.bf ]]; then
        languages+=("befunge")
    else
        echo "No language detected! Aborting..."
        exit 1
    fi
    if [[ ${#languages[@]} -gt 1 ]]; then
        echo "Multiple languages detected! Aborting..."
        exit 1
    fi
    echo "${languages[0]}"
}
cat /var/jenkins_home/whanos.txt
echo "Starting whanos..."
echo "Current directory: $(pwd)"

last_hash=""

if [[ -f /var/jenkins_home/last_commit ]]; then
    last_hash=$(cat /var/jenkins_home/last_commit)
fi

# Get the last commit hash
current_hash=$(git rev-parse HEAD)

# Update the last commit hash
echo "$current_hash" >/var/jenkins_home/last_commit

if [[ "$last_hash" != "$current_hash" ]]; then
    # Update the last commit hash
    echo "$current_hash" >/var/jenkins_home/last_commit
    echo "Changes detected! Analyzing..."

    if [[ -f Dockerfile ]]; then # Build the Dockerfile
        echo "$1 provides a Dockerfile, building..."

        # Build the image
        docker build -t "$1" .

    else # Build standalone images
        echo "$1 does not provide a Dockerfile, building standalone images..."

        # Find the languages
        language=$(find_languages)
        echo "Detected language: $language, building..."

        # Build the images
        docker build . -t "$1" -f "/var/jenkins_home/images/$language/Dockerfile.standalone"
    fi
    docker tag "$1" "localhost:5000/$1"
    docker push "localhost:5000/$1"
    docker rmi "$1"

    echo "Created image $1 on localhost:5000/$1"
    echo "Building done!"

    # Deploy the image if whanos.yml is present
    echo "Searching for whanos.yml..."
    if [[ -f whanos.yml ]]; then
        echo "whanos.yml found, deploying..."

        # Todo:
        # exec deployement script
        # $1 deployment name
        # $2 path to whanos.yml
        # $3 image name

    else
        echo "whanos.yml not found, not issuing deployment..."
    fi

    echo "Job done!"
    elseh
    echo "No changes detected, aborting..."
fi
