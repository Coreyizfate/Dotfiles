#!/bin/bash

read -p "Set description for snapshots: " user_desc

sudo snapper -c root create -d "${user_desc}@root"

sudo snapper -c home create -d "${user_desc}@home"

sudo snapper -c var create -d "${user_desc}@var"
