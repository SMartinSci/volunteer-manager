User.create(name: "Sam", email: "samuelj@gmail.com", password: "test1234")
Task.create(description: "Photograph as many volunteers as possible during the event.", role_id: 1)
Role.create(name: "Photographer", user_id: 1, project_id: 1)
Task.create(description: "Photograph as many volunteers as possible during the event.", role_id: 2)
Role.create(name: "Organizer", user_id: 1, project_id: 1)
Project.create(name: "Walnut Park Cleanup", location: "Walnut Park", time: '8:00 AM', date: "2019-02-13", description: "Trash is one of the most widesread pollution problems threatening public spaces. Volunteers have the opportunity to lend a hand and beautify their local park with this cleanup event.")


User.create(name: "Chelsea", email: "chelsea@gmail.com", password: "test12345")
Task.create(description: "Photograph as many volunteers as possible during the event.", role_id: 3)
Role.create(name: "Set-up and Tear-down", user_id: 2, project_id: 1)
Task.create(description: "Photograph as many volunteers as possible during the event.", role_id: 4)
Role.create(name: "Parking assistant", user_id: 2, project_id: 2)
Project.create(name: "Knits for Nature", location: "YMCA Community Center", time: '1:00 PM', date: "2019-03-23", description: "Knits for Nature begun after a number of oil spills near Phillip Island in the late 1990s to early 2000s. Knitted penguin jumpers play an important role in saving little penguins affected by oil pollution. A patch of oil the size of a thumb nail can kill a little penguin. Oiled penguins often die from exposure and starvation. Oil separates and mats feathers, allowing water to get in which makes a penguin very cold, heavy and less able to successfully hunt for food.")

User.create(name: "John", email: "john@gmail.com", password: "test12345")
Task.create(description: "Photograph as many volunteers as possible during the event.", role_id: 5)
Role.create(name: "Registration", user_id: 3, project_id: 3)
Project.create(name: "Blood Drive", location: "Blood Center downtown", time: '10:00 AM', date: "2019-02-23", description: "Blood Donor Services counts on volunteers as much as we count on blood donors to achieve the mission of providing a safe and adequate blood supply to our community.")