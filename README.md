# Github Search, Language & Issue Scraper
This tool will traverse through the search API and hydrate the `languages` and `issues` in the response. It will save the results to `output.json` in the working directory. The filename has been gitignored so you don't have to worry about having the results committed to the project.

## Getting Started
To run this project you will need a [Github Personal Access Token](https://docs.github.com/en/free-pro-team@latest/github/authenticating-to-github/creating-a-personal-access-token).

Copy your Github PAT and navigate to your working directory.
`export GITHUB_PAT=YOUR_ACCESS_TOKEN` and save your access token as an environment variable.

You may then run `bundle install` to fetch the relevant dependencies of the project and `ruby scraper.rb`

The results will be saved to `output.json`
