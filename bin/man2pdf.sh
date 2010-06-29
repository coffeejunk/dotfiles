#!/bin/bash
man $1 -t | ps2pdf - $1.pdf
