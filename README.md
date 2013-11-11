Acts As Paywall
===============

[![Code Climate](https://codeclimate.com/repos/528026ce7e00a409880c73df/badges/b5935433512c43fbbe65/gpa.png)](https://codeclimate.com/repos/528026ce7e00a409880c73df/feed)

Turn your Rails app into a paywall!

Install
-------

Add 'acts_as_paywall' to your Gemfile:

`gem 'acts_as_paywall'`

Use
---

Call `acts_as_paywall` in the relevant controllers (or just in ApplicationController).

Arguments
---------

Acts As Paywall can take the following arguments:

- `permissible_controllers`: An array of controller names that do not count against a user's content view count. Defaults to none.
- `free_views`: The number of free content views that each user's session should be allotted. Defaults to 5.
- `wall_url`: The URL to redirect a user to after they have exceeded their allotted `free_views`. Defaults to the application's `root_url`
- `content_view_cookie_key`: The cookie key to use to store the number of content views. Defaults to `:content_views`

Contributing
------------

To contribute, please fork and submit a pull request.

Todo
----

- Testing
