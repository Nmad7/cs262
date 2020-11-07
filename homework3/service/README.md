# CS 262 - Homework3

a. https://cs262-lab9.herokuapp.com, https://cs262-lab9.herokuapp.com/players, https://cs262-lab9.herokuapp.com/inProgress, https://cs262-lab9.herokuapp.com/players/:id

b. "/" and "/inProgress" both only allow get requests making them both idempotent and nullipotent. "/players" allows get requests (idempotent and nullipotent) but also allows put, post, and delete requests. Both delete and put are idempotent but not nullipotent and post requests are neither.

c. This service is RESTful. Requests are stateless, there is seperation between client and server, the server uses only standard HTTP methods, and the server uses a url paths to serve data files.

d. Yes, impedance mismatch exists as while data sits in a relational database, the server sends the data to the client in the form of a json file.
