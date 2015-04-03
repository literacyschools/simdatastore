# Decentralized data store

## introduction

A distributed datastore built on top of command-line tools that are widely availabe


## Why?

Why labels/tags? 
they are the easiest way to add multidimensional attributes to the main piece content
Why distributed/replicated?
intermittent, unreliable connection
lots peer to peer exchanges
Requirements

For our design, documents, content or data is used interchangeably.

* Can store arbitrary content types of arbitrary size 
* Can universally identify every content instances by UUID
* Can track authorship and modification
* Can associate each document to tags (embedded into the document structure)
* Can search data based on tags
* Can register interest in a certain type of tags
* Can set application-defined limits to the size of the datastore with different algorithms to manage the data (Example: LRU - Least-Recently Used)

## Design

Distributed key-value store kept under a versioning system across devices with automatic synchronization.

* Every bit of data has tags associated to it
* Tags are indexed locally on the device
* Can allocate certain maximum amount of data 

## Implementation

Network services discovery
https://allseenalliance.org/developers/develop/api-guide/core/android
Extensible, versioned, binary structured data format (on wire, on disk, in memory)
https://capnproto.org/
 Distributed Computing solution
https://zeroc.com

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

Overview:

* creates directory structure
* creates dummy data with UUID
* add dummy data to git/git-annex
* synchronize with remotes

Setting up the data:

```
./setup.sh
```

Adding remotes:

```
./connections.sh
```
