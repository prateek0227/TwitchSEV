# TwitchSEV

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

The following questions have been answered in this demo project :-

1. The first/home page lets a user login with Twitch and set their favorite Twitch streamer name. This initiates a backend event listener which listens to all events for given streamer.

*For this question, I was able to complete the first part of the question but the second part was a little confusing and the most suitable answer that I found was that of using webhooks (the user follows event) but it is not returning any response when I tried to follow a user.*

2. The second/streamer page shows an embedded livestream, chat and list of 10 most recent events for your favorite streamer. This page doesn’t poll the backend and rather leverages web sockets and relevant Twitch API.

*Embedding the twitch app for the selected streamer has been done successfully. By the list of 10 most recent events, what I understood was to list the Future and Past events of the current streamer. I was able to find one streamer who had some Events so I intentionally queried for that user just to show the list of the events.*

Additionally please answer following questions at the bottom of your README:

1. How would you deploy the above on AWS? (ideally a rough architecture diagram will help)
2. Where do you see bottlenecks in your proposed architecture and how would you approach scaling this app starting from 100 reqs/day to 900MM reqs/day over 6 months?

*I don't have enough knowledge about AWS, so, I won't be able to answer these questions. But, using elixir and phoenix, we won't find much of a bottleneck as regards to the number of users requesting the server on a single day as elixir is built on the erlang ecosystem and the erlang vm has been built specifically to handle more the 2 million concurrent requests on a single server. So if we can provide enough memory to the EVM on AWS, we won't face server load.

Another option would be to deploy this elixir/phoenix application using Gigalixir which provides a full distributed clustering support to run elixir applications and by this the thought of bottleneck is gone as I have already told how many concurrent requests the elixir ecosystem can handle.*
