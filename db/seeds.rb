User.create(name: "Sam", email: "samuelj@gmail.com", password: "test1234")
Task.create(description: "Photograph as many volunteers as possible during the event.", role_id: 1)
Role.create(name: "photographer", user_id: 1, project_id: 1)
Project.create(name: "Walnut Park Cleanup", location: "Walnut Park", time: '8:00 AM', date: "2019-01-23", description: "Trash is one of the most widesread pollution problems threatening public spaces. Volunteers have the opportunity to lend a hand and beautify their local park with this cleanup event.")