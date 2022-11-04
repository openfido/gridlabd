#!/bin/bash
git clone https://source.gridlabd.us/ -b master --depth 1 gridlabd
cd gridlabd
gridlabd -T 0 -W autotest --validate
