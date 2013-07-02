#!/bin/sh

awk '/\<body/ {flag=1;next} /\<!-- Saved in parser cache/{flag=0} flag { print }' 
