source ~/.profile
export PATH=$PATH:/usr/local/sbin
# export DOCKER_BUILDKIT=0
# export COMPOSE_DOCKER_CLI_BUILD=0
# Add RabbitMQ.app binaries to path
#PATH="/Applications/RabbitMQ.app/Contents/Resources/Vendor/rabbitmq/sbin:$PATH"
alias dc='docker-compose'
alias up='docker-compose up -d'
alias down='docker-compose down'
alias push='sh push.sh'
#alias minikube='/usr/local/Cellar/minikube/1.25.1/bin/minikube'
