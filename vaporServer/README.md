# Server for iOS Demo Apps
---

This is a basic server that returns a hardcoded list of people
## Endpoints:
`/list` :
* Returns a list of people with name and id
`/listAll` :
* Returns a list of people with names, ids, phones, and ages
`/personByID` : 
* Parameters: `id=<id>`
* Returns a single persona and all their details

## Starting the Server:
1. Install Vapor: `curl -sL toolbox.vapor.sh | bash`
2. In the directory with Package.swift, run `vapor build`
3. Once the build has completed, run `vapor run serve`