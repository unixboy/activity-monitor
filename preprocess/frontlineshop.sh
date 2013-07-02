#!/bin/sh

awk '/\<div class="mod" id="product-display"/ {flag=1;next} /\<!-- id="product-details" //--\>/{flag=0} flag { print }' 
