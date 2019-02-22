#!/bin/bash

sed -i'' "s~https://github.com/bennyn/bennyn.github.io.git~https://${GH_TOKEN}@github.com/bennyn/bennyn.github.io.git~" _config.yml
npx hexo deploy
