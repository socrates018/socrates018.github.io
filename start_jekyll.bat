@echo off
cd /d "%~dp0"
start "" "http://localhost:4000"
bundle exec jekyll serve --livereload --host 0.0.0.0 --drafts
