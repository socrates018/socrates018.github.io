@echo off
cd /d "%~dp0"
start cmd /k "bundle exec jekyll serve"
