echo "Building the container for the first time..."
docker build -t chapter10-demo .

echo "Building the container once again...Should be using cached layers"
docker build -t chapter10-demo .