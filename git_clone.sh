#!/bin/bash

if [ ! -d "application" ]
then
  git clone git@github.com:smartformer/springboot-articles_api.git application
  cd application
  git config core.filemode false
fi
