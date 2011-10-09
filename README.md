SubbySub
========

SubbySub is a URL shortener that works with subdomains rather than paths. Uses SQLlite3 as DB.

Example
-------

[http://github.hadric.us](http://github.hadric.us) (redirects to my GitHub Profile)

Installation
------------

1. Clone this repo
2. Set up a wildcard subdomain DNS entry to point to your server (so that all subdomains resolve to the one address)
	* e.g. *.hadric.us
3. rake db:migrate
4. Create config/config.yaml and specify user and password (used for Auth)

Config.yml
----------

		development:
			parent_domain: <parent domain>
			username: <username>
			password: <password>
			
		test:
			parent_domain: <parent domain>
			username: <username>
			password: <password>
			
		production:
			parent_domain: <parent domain>
			username: <username>
			password: <password>

Thanks
------

* Ryan Bates for the [Subdomains RailsCast](http://railscasts.com/episodes/221-subdomains-in-rails-3)
* PerfectLine for [validate_url](https://github.com/perfectline/validates_url)
* Thomas McDonald for [bootstrap-sass](https://github.com/thomas-mcdonald/bootstrap-sass)