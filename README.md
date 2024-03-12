# Deploy to Firebase for Node18

A GitHub Action to deploy to Firebase for Node18.

- Make sure that you checkout the repository using the [actions/checkout](https://github.com/actions/checkout) action
- Make sure that you have the `firebase.json` file in the repository
- To obtain the Firebase token, run `firebase login:ci` on your local computer and [store the token](https://docs.github.com/en/actions/reference/encrypted-secrets#creating-encrypted-secrets-for-a-repository) as the `FIREBASE_TOKEN` secret
- To obtain service account credentials, get the service account JSON file from Firebase console and set its path to `GOOGLE_APPLICATION_CREDENTIALS`
- Either `FIREBASE_TOKEN` or `GOOGLE_APPLICATION_CREDENTIALS` are required to deploy the project. No need to set both at the same time.
- Specify the Firebase project name in the `FIREBASE_PROJECT` env var.
- By default, the action will deploy all firebase components. If you just want to deploy the functions, set `FUNCTIONS_ONLY` env var to any value.

## Workflow examples

Deploy the `main` branch when a commit is pushed to it:

```
name: Deploy the main branch
on:
  push:
    branches:
      - main
jobs:
  main:
    name: Deploy to Firebase
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: dayzero-eng/deploy-firebase-functions@v0.0.5
      env:
        FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
        FIREBASE_PROJECT: firebase-project-id
```

Deploy only when a tag starts with `v` is pushed:

```
name: Deploy a tag
on:
  push:
    tags:
      - v*
jobs:
  main:
    name: Deploy to Firebase
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: dayzero-eng/deploy-firebase-functions@v0.0.5
      env:
        FIREBASE_TOKEN: ${{ secrets.FIREBASE_TOKEN }}
        FIREBASE_PROJECT: firebase-project-id
```
