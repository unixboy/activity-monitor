#!/bin/sh

awk '/\<body/ {flag=1;next} /\<small\>Generated/{flag=0} flag { print }' 
