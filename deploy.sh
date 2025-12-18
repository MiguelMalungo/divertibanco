#!/bin/bash
# Deployment script for GitHub Pages
# This script deploys the current files to the gh-pages branch

echo "Deploying to GitHub Pages..."

# Get the current branch name
CURRENT_BRANCH=$(git branch --show-current)

# Stash any uncommitted changes
git stash

# Switch to gh-pages branch
git checkout gh-pages

# Remove all files except .git
git rm -rf . 2>/dev/null || true

# Checkout files from main branch
git checkout main -- *.html styles.css img/

# Commit the changes
git add -A
git commit -m "Deploy: Update from main branch" || echo "No changes to deploy"

# Push to gh-pages
git push origin gh-pages

# Switch back to original branch
git checkout $CURRENT_BRANCH

# Restore stashed changes if any
git stash pop 2>/dev/null || true

echo "Deployment complete!"
echo "Your site should be available at: https://miguelmalungo.github.io/divertibanco/"



