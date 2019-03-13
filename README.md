# concourse-danger-js-resource
A concourse resource to use danger-js.

## prerequisite
This resource assumed to be used with [github pull request resource](https://github.com/jtarchie/github-pullrequest-resource).

## resource config
|key|type|required|default|description|
|--|--|--|--|--|
|repo_slug|string|yes||`username/reponame` shaped string to identify target repository|
|github_api_token|string|yes||access token of github|
|github_host|string|no|github.com|required when using github enterprise|
|github_api_base_url|string|no|https://api.github.com|required when using github enterprise|

## `check`
## `in`
## `out`

### params
|key|type|required|default|description|
|--|--|--|--|--|
|workdir|string|yes||path to workdir to exec `danger ci`|
|dangerfile|string|no|dangerfile.js|path to dangerfile from workdir|


```yaml
resource_types:
- name: pull-request
  type: docker-image
  source:
    repository: jtarchie/pr

- name: danger
  type: docker-image
  source:
    repository: yoshiyuki/concourse-danger-js-resource

resources:
- name: src-pr
  type: pull-request
  source:
    repo: your/repo
    access_token: your_access_token

- name: danger
  type: danger
  source:
    repo_slug: your/repo
    github_api_token: your_access_token

jobs:
- name: review
  plan:
  - get: src-pr
  - put: danger
    params:
      workdir: src-pr
```
