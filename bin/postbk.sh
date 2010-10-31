#!/bin/bash
(sleep 60; diskutil unmount "$2" >> /Library/Logs/CCC.log 2>&1) &
