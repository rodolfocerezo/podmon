#!/bin/bash

err_invalid_port="Error: Port must be a numeric value.\n\n"
err_port_in_use="Error: Port is already in use.\n\n"
help="Run API service\n\nDescription:\n  Run an API service\n\nEnable a listening service for API access to Podman commands.\n\n\nUsage:\n  podman-start -p [port]\n\nExamples:\n  podman-start -p 5000\n\nOptions:\n  -p\tPort (default 5000)\n  -h\tHelp\n"

if [[ $# -eq 1 ]] && [[ $1 == "-h" ]]; then
  echo -e $help
  exit
fi

if [[ $# -ne 2 ]]; then
  echo -e $help
  exit
fi

if [[ $# -eq 2 ]] && [[ $1 == "-p" ]] && [[ ! $2 =~ ^[0-9]+$ ]]; then
  echo -e "$err_invalid_port$help"
  exit
fi

if [[ -n $(ss -lntu | grep $2) ]]; then
  echo -e "$err_port_in_use$help"
  exit
fi

echo -e "Starting API service at the following address:\n  http://localhost:$2\n"
podman system service --time=0 tcp:localhost:$2