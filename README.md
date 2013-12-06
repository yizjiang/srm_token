Gatekeeper project

This gem provides following functionality:

1. Request access token for the internal http request
2. Verify the access token and process the request accordingly

Example function provided:
1. Sending Request
Gatekeeperizer::SrmRequest.get( host, path, header= {} , params= {} )
Gatekeeperizer::SrmRequest.post( host, path, header= {} , params= {} )
  .
  .
  .

2. Receiving request
gatekeeper_for :get_access (create before_filter for the get_access method in the controller to validate access token)

3. Initializer
have to create gatekeeperizer.rb in config/initializer in each application to initialize the following thing (maybe more)
  1. client id / secret
  2. redis configuration
