#!/bin/bash
conky -c conkyrc_wmfs | while true; read line; do wmfs -c status "default $line"; done &
