# NSF-Catalogue

RegisterAndPlanner XML Database that offers a web service through which is possible to perform the proposed queries. 

It supports the following queries: 
* <a name="twonsf"></a>two_nsf_comparison.xq: it receives two NSF names and checks if their Security Capability Sets are: contained each other, equivalent, or their intersection is empty. 
* <a name="onensf"></a>one_nsf_comparison.xq: it receives an NSF name and returns the list of NSFs that provide the same Security Capabilities provided by the input NSF. 
* <a name="rulesearch"></a>rule_nsf_search.xq: it receives the path of a RuleInstance file and returns the NSF that is able to implement the policies stated within the above file. 
* <a name="capasearch"></a>capa_set_search.xq: it receives a set of Security Capabilities and returns which NSF provides those items. 
* <a name="ovsearch"></a>overall_search.xq: it returns the list of all the available Security Capabilities arranged by type. 


# Getting Started
## Prerequisites
In order to run the proposed RegisterAndPlanner Database, Docker is required and it can be found [here](https://docs.docker.com/get-docker/). 
 
## Installation
Clone the current repository: <br>
`git clone git@github.com:torsec/NSF-Catalogue.git`

Move into project folder: <br>
`cd NSF-Catalogue`

Build Dockerfile: <br>
`docker build -t register_and_planner .`

Run the Dockerfile containing RegisterAndPlanner server: <br>
`docker run -p 8984:8984 register_and_planner`

At this point, RegisterAndPlanner server is listening on `http://localhost:8984`.

## Usage
Examples of how to `curl` the RegisterAndPlanner Server. <br>
For [two_nsf_comparison.xq](#twonsf): <br>
`curl -i "http://localhost:8984/rest?run=two_nsf_comparison.xq&nsf_a=StrongSwan&nsf_b=XFRM" -u admin:admin`.

For [one_nsf_comparison.xq](#onensf): <br>
`curl -i "http://localhost:8984/rest?run=one_nsf_comparison.xq&nsf_in=StrongSwan" -u admin:admin`.

For [rule_nsf_search.xq](#rulesearch): <br>
`curl -i "http://localhost:8984/rest?run=rule_nsf_search.xq&rule_instance_path=Strongswan_RuleInstance.xml" -u admin:admin`.

For [capa_set_search.xq](#capasearch): <br>
`curl -i "http://localhost:8984/rest?run=capa_set_search.xq&capa_set=SourcePortConditionCapability,IpDestinationAddressConditionCapability" -u admin:admin`, here Security Capabilities have to be provided with first capital letters and the separator is `,` without spaces. 

For [overall_search.xq](#ovsearch): <br>
`curl -i "http://localhost:8984/rest?run=overall_search.xq" -u admin:admin`.