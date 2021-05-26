# Exploring Async/Await

A first look at how async/await works in Swift. 

## About

This repository contains a very simple app that fetches a profile from Github. It was first implemented using the callback based URLSession, then it was refactored to use the new async/await features.

### Refactoring

Once the repository is cloned, there are some tags with each step of this refactoring process:

- `start-async-work` -> contains the initial callback based code, ready to be refactored
- `async-httpclient` -> the first refactoring effort: make the http client `perform()` method an async function
- `async-profileservice` -> add async versions of the profile service methods
- `async-viewmodel-imagefetcher` -> turn the viewmodel and the imagefetcher methods into async functions
- `async-call-from-controller` -> initiates the async from a non-async code

## Using Toolchains

As of now (may 25, 2021), the concurrency features are in development. Such features are available for experimentation. They can be accessed by the development toolchains, that are generated from the `main` swift branch.

Here's the link to download the latest development toolchains: https://swift.org/download/#snapshots

Note: most refactoring was done using a toolchain from May 05-14-2021, however, the most recent commits to this repository will be using more up to date toolchains.

## Useful links:

- Async/await proposal: https://github.com/apple/swift-evolution/blob/main/proposals/0296-async-await.md
- Structured concurrency proposal: https://github.com/apple/swift-evolution/blob/main/proposals/0304-structured-concurrency.md
- Continuations proposal: https://github.com/apple/swift-evolution/blob/main/proposals/0300-continuation.md
- Pitch regarding the initialization of concurrent work: https://forums.swift.org/t/initiating-asynchronous-work-from-synchronous-code/47714
