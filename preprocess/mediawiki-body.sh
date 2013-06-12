#!/bin/sh

awk '/\<body/ {flag=1;next} /\<div id="footer"\>/{flag=0} flag { print }' 
