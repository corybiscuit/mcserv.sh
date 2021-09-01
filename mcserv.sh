#!/bin/bash

# Load config
source server.config

# Start tmux session
{
    tmux new-session -d -s $SERVER_NAME
}||{
    echo "ERROR: Could not create tmux session."
    exit 1
}

# Start server
{
    tmux send-keys -t $SERVER_NAME "cd $SERVER_DIR"
    tmux send-keys -t $SERVER_NAME "java -Xms$MEM -Xmx$MEM -jar $SERVER_JAR"
    echo "Server appears to have started successfully."
    echo "Use 'tmux a -t $SERVER_NAME' to attach to screen and check status."
}||{
    echo "ERROR: Could not start server."
    exit 1
}