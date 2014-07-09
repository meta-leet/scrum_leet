Exposes Scrum tool through API.

In active development, not yet ready.

Resources :

List of products
/products/
Array of product Names

Product 
/product/{product-name}/
A product must have name
A product may have description


List of features in product's backlog
/products/{product-name}/backlog


List of product's sprints
/products/{product-name}/sprints

Sprint
/products/{product-name}/sprints/{sprint-label}

Sprint Features
/products/{product-name}/sprints/{sprint-label}/features

Feature
/feature/{feature-id}
Have description
May refer to other resources ( hyperlinks )
Must belong to backlog xor sprint ( which itself belongs to product )
Must Have state
May Have Scale



