# ruby-orchestration
A basic POC for a proxy server in Ruby, which orchestrates the transmission of JSON data to various endpoints.

## Run Locally

1. Make sure you have Ruby installed on your system.
2. Clone this repository and `cd` into it.
3. Start the endpoint listeners, each in their own terminal window: `ruby listener_one.rb` and `ruby listener_two.rb`
4. Start the main server: `ruby workflow_proxy.rb`
5. Use [Postman](https://www.getpostman.com/) or a similar tool to send a POST request to the endpoint: `localhost:4567/api/v2/orchestration` (TODO: make this configurable via properties file). Refer to `example_request.json` to see what it's expecting requests to look like.
6. In the terminal windows, the servers will print out the data they receive, confirming that it was passed properly.
