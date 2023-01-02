#! /usr/bin/env bash

doctl compute droplet list --format='Name,PublicIPv4,Region,Image,Status'
