# Decentralized data store

## introduction

A distributed datastore built on top of command-line tools that are widely availabe

## process

A piece of data is created and added to the distributed store

* quota check, data garbage collection
* data is created in the shared drive as a UUID
* related metadata is checked in git

Metadata is distributed

* connection to remote tablet
* remote git repository added (ssh remote)
* pull changes
* merge with local changes
* push changes
* diff changes from previous commit
* loop through metadata to add to index
* prioritize and select interesting data (sum < remaining)

Data is transferred

* btsync is configured to add any other tablet connected
* btsync is configured to transfer metadata

## tools

* btsync: for synchronizing data
* git: for storing versioned metadata
* git-annex: for storing binary content

For Android, the challenge will be to create 

## simulation

Setup:

* brew install git-annex

* create tablet1, tablet2, tablet3, hosts entry in /etc/hosts pointing to 127.0.0.1
* mkdir -p ~/ls/sim/tablet[123]/data
* in each data repository
 * git annex init


in each directory create files placehoders for "data" identified by UUID:

* for i in $(seq 1 10); do touch `uuidgen`; done