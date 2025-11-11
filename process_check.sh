#!/bin/bash
echo "Top 5 CPU consuming processes:"
ps -eo pid,comm,%mem,%cpu --sort=-%cpu | head -6
