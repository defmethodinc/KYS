# README

##Rails propotype of libraty/frameworks internal project

### How to use:

- After create migrate and seed

Queries can be done by using Member Model method get_members(params) on the rails console.

Where params is an Array of hashes with :

tool_ids and confidence levels

````
[ {tool_id:[1], confidence_level[1,5]}]
````

in this case it will return all members who knows "Cypress", with connfidennce level between 1 and 5

````
[ {tool_id:[1, 2], confidence_level[1,5]}]
````
in this case it will return all members who knows "Cypress OR ActiveAdmin", with connfidennce level between 1 and 5

````
[ {tool_id:[1], confidence_level[1,5]}, {tool_id:[2], confidence_level[5,5]} ]
````

in this case it will return all members who knows "Cypress", with connfidennce level between 1 and 5 OR ActiveAdmin with level 5.

````
[[{tool_id:[1], confidence_level[5,5]}, {tool_id:[2], confidence_level[5,5]}] ]
````

in this case it will return all members who knows "Cypress AND ActiveAdmin", with connfidennce te respective confidence level.

````
[ {tool_id:[1], confidence_level[1,5]} , [{tool_id:[2], confidence_level[5,5]}, {tool_id:[3], confidence_level[5,5]}]]
````

in this case it will return all members who knows "Cypress" OR All members who knows ActiveAdmoin AND Phanteon, with connfidennce te respective confidence level.

