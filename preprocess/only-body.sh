#!/bin/sh

awk '/\<body/ {flag=1;next} /\<\/body\>/{flag=0} flag { print }' 
