[![Build Status](https://travis-ci.org/meta-leet/scrum_leet.svg?branch=master)](https://travis-ci.org/meta-leet/scrum_leet)

[![Code Climate](https://codeclimate.com/github/meta-leet/scrum_leet.png)](https://codeclimate.com/github/meta-leet/scrum_leet)

Exposes Scrum tool through API.

In active development, not yet ready.

## First Iteration

It should just allow to use the tool to produce the next iteration :) Recursion is everywhere.

* Single user no authentication
* Simple Scrum managment with product, backlog, sprint and features.
* Features will just have Short description, Long description, Scale,  Current state.


## Hypermedia controled API 

For the sake of interoperability and as a real use case example, I'll focus first on the outer interface.
I think the media-type to fit this job should have some properties related to project's context :

* It should be Easy to integrate and parse.
* Must be Machine to Machine oriented
* Should not loose too much human readability
* Must be read/write

I've been considering lots of different hypermedia drafts :

* UBER(https://groups.google.com/forum/#!forum/uber-hypermedia) thank's to Mike Amundsen! Even if I think it take the good way, and will keep involved in this format, It won't be my first choice. Mainly because I'am looking for something easier to integrate with.
* JSON-LD(http://json-ld.org/learn.html) , great for web graph crowling and very complete, but seems too demanding for an early alpha stage software. ( But in futur releases i'd like to add this alternative along with HYDRA )
* HAL(http://stateless.co/hal_specification.html), As Uber it can be minimalist, but is not protocol and serialization agnostic. It still a draft, and does not specify controls, but is really readable.

I'll first start with an HAL implementation, because it can be integrated in small steps, and mostly because it will be easier to integrate with services that does not have hypermedia mastery. The resource state being standard json object, it is pretty near every non hypermedia API, but it allow to convey links, and relations.
Added to the halo+json(https://gist.github.com/mikekelly/3808215) draft of draft of draft ... It can convey controls and Schema.



## Resources :

* List of products
  * /products/
  * Array of product Names

* Product 
  * /product/{product-name}/
  * A product must have name
  * A product may have description


* List of features in product's backlog
  * /products/{product-name}/backlog


* List of product's sprints
  * /products/{product-name}/sprints

* Sprint
  * /products/{product-name}/sprints/{sprint-label}

* Sprint Features
  * /products/{product-name}/sprints/{sprint-label}/features

* Feature
  * /feature/{feature-id}
  * Have description
  * May refer to other resources ( hyperlinks )
  * Must belong to backlog xor sprint ( which itself belongs to product )
  * Must Have state
  * May Have Scale



