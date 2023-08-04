# Use the official RabbitMQ image with management-alpine tag
FROM rabbitmq:management-alpine

# Expose the necessary ports
EXPOSE 15672 5672

# Set the container name
ENV CONTAINER_NAME=rabbitmq

# Run RabbitMQ in the foreground and enable TTY
CMD ["rabbitmq-server"]
