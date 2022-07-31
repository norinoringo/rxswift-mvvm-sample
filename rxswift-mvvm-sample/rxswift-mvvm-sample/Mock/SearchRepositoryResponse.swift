//
//  SearchRepositoryResponse.swift
//  rxswift-mvvm-sample
//  
//  Created by hisanori on 2022/07/31.
//  


import Foundation

struct SearchRepositoryResponseModel {
    var name: String?
    var url: String?
    var description: String?
    var stargazersCount: Int?
    var language: String?

    init(name: String?, url: String?, description: String?, stargazersCount: Int?, language: String?) {
        self.name = name
        self.url = url
        self.description = description
        self.stargazersCount  = stargazersCount
        self.language = language
    }
}

class MockSearchRepositoryResponse {
    var mockResoponse:String {
        return
"""
{
  "total_count": 245489,
  "incomplete_results": false,
  "items": [
    {
      "id": 44838949,
      "node_id": "MDEwOlJlcG9zaXRvcnk0NDgzODk0OQ==",
      "name": "swift",
      "full_name": "apple/swift",
      "private": false,
      "owner": {
        "login": "apple",
        "id": 10639145,
        "node_id": "MDEyOk9yZ2FuaXphdGlvbjEwNjM5MTQ1",
        "avatar_url": "https://avatars.githubusercontent.com/u/10639145?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/apple",
        "html_url": "https://github.com/apple",
        "followers_url": "https://api.github.com/users/apple/followers",
        "following_url": "https://api.github.com/users/apple/following{/other_user}",
        "gists_url": "https://api.github.com/users/apple/gists{/gist_id}",
        "starred_url": "https://api.github.com/users/apple/starred{/owner}{/repo}",
        "subscriptions_url": "https://api.github.com/users/apple/subscriptions",
        "organizations_url": "https://api.github.com/users/apple/orgs",
        "repos_url": "https://api.github.com/users/apple/repos",
        "events_url": "https://api.github.com/users/apple/events{/privacy}",
        "received_events_url": "https://api.github.com/users/apple/received_events",
        "type": "Organization",
        "site_admin": false
      },
      "html_url": "https://github.com/apple/swift",
      "description": "The Swift Programming Language",
      "fork": false,
      "url": "https://api.github.com/repos/apple/swift",
      "forks_url": "https://api.github.com/repos/apple/swift/forks",
      "keys_url": "https://api.github.com/repos/apple/swift/keys{/key_id}",
      "collaborators_url": "https://api.github.com/repos/apple/swift/collaborators{/collaborator}",
      "teams_url": "https://api.github.com/repos/apple/swift/teams",
      "hooks_url": "https://api.github.com/repos/apple/swift/hooks",
      "issue_events_url": "https://api.github.com/repos/apple/swift/issues/events{/number}",
      "events_url": "https://api.github.com/repos/apple/swift/events",
      "assignees_url": "https://api.github.com/repos/apple/swift/assignees{/user}",
      "branches_url": "https://api.github.com/repos/apple/swift/branches{/branch}",
      "tags_url": "https://api.github.com/repos/apple/swift/tags",
      "blobs_url": "https://api.github.com/repos/apple/swift/git/blobs{/sha}",
      "git_tags_url": "https://api.github.com/repos/apple/swift/git/tags{/sha}",
      "git_refs_url": "https://api.github.com/repos/apple/swift/git/refs{/sha}",
      "trees_url": "https://api.github.com/repos/apple/swift/git/trees{/sha}",
      "statuses_url": "https://api.github.com/repos/apple/swift/statuses/{sha}",
      "languages_url": "https://api.github.com/repos/apple/swift/languages",
      "stargazers_url": "https://api.github.com/repos/apple/swift/stargazers",
      "contributors_url": "https://api.github.com/repos/apple/swift/contributors",
      "subscribers_url": "https://api.github.com/repos/apple/swift/subscribers",
      "subscription_url": "https://api.github.com/repos/apple/swift/subscription",
      "commits_url": "https://api.github.com/repos/apple/swift/commits{/sha}",
      "git_commits_url": "https://api.github.com/repos/apple/swift/git/commits{/sha}",
      "comments_url": "https://api.github.com/repos/apple/swift/comments{/number}",
      "issue_comment_url": "https://api.github.com/repos/apple/swift/issues/comments{/number}",
      "contents_url": "https://api.github.com/repos/apple/swift/contents/{+path}",
      "compare_url": "https://api.github.com/repos/apple/swift/compare/{base}...{head}",
      "merges_url": "https://api.github.com/repos/apple/swift/merges",
      "archive_url": "https://api.github.com/repos/apple/swift/{archive_format}{/ref}",
      "downloads_url": "https://api.github.com/repos/apple/swift/downloads",
      "issues_url": "https://api.github.com/repos/apple/swift/issues{/number}",
      "pulls_url": "https://api.github.com/repos/apple/swift/pulls{/number}",
      "milestones_url": "https://api.github.com/repos/apple/swift/milestones{/number}",
      "notifications_url": "https://api.github.com/repos/apple/swift/notifications{?since,all,participating}",
      "labels_url": "https://api.github.com/repos/apple/swift/labels{/name}",
      "releases_url": "https://api.github.com/repos/apple/swift/releases{/id}",
      "deployments_url": "https://api.github.com/repos/apple/swift/deployments",
      "created_at": "2015-10-23T21:15:07Z",
      "updated_at": "2022-07-30T23:15:39Z",
      "pushed_at": "2022-07-30T21:41:39Z",
      "git_url": "git://github.com/apple/swift.git",
      "ssh_url": "git@github.com:apple/swift.git",
      "clone_url": "https://github.com/apple/swift.git",
      "svn_url": "https://github.com/apple/swift",
      "homepage": "https://swift.org",
      "size": 838069,
      "stargazers_count": 60206,
      "watchers_count": 60206,
      "language": "C++",
      "has_issues": true,
      "has_projects": false,
      "has_downloads": true,
      "has_wiki": false,
      "has_pages": false,
      "forks_count": 9689,
      "mirror_url": null,
      "archived": false,
      "disabled": false,
      "open_issues_count": 5996,
      "license": {
        "key": "apache-2.0",
        "name": "Apache License 2.0",
        "spdx_id": "Apache-2.0",
        "url": "https://api.github.com/licenses/apache-2.0",
        "node_id": "MDc6TGljZW5zZTI="
      },
      "allow_forking": true,
      "is_template": false,
      "web_commit_signoff_required": false,
      "topics": [

      ],
      "visibility": "public",
      "forks": 9689,
      "open_issues": 5996,
      "watchers": 60206,
      "default_branch": "main",
      "score": 1.0
    }
  ]
}
"""
    }
}
