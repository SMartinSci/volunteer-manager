# Volunteer Manager

An app in rails for volunteers to manage volunteer projects, roles, and tasks. Volunteer manager provides volunteer groups with a limited CRUD interface for any type of task that is to be completed on a project.

## Installation/Development
Use Ruby 2.3.3 and Rails 5.2.2. To begin developing with Volunteer Manager, fork and clone this repo, then run:

    $ bundle install
    $ rake db:migrate

To run your own local development server, run:

    $ rails s
    
If using Facebook Omniauth, run:

    $ thin start -ssl 
        
to launch website.
    
Go to http://localserver:3000 to start navigating, if using Facebook Omniauth, go to https://localserver:3000

## Contributing

Contributions are welcome via pull requests and issues. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The app is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
