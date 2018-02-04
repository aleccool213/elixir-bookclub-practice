# Ecom crawling/indexing soln in Elixir

**Goal**: Learn Elixir / OTP / Phoenix by writing an Elixir crawler and indexer, with a simple admin dashboard.

## Techhnologies / Paradigms Learned**

* **Functional programming**: Elixir language in general
* **Concurrency / High Avail / Resilience**: OTP
* **Channels / WebSockets**: Phoenix admin dashboard

## Milestones

### M1

* Pass in a list of URL to index
* For each URL, start an indexing pipeline
  * Grab data:
    * Name
    * SKU
    * Descr
    * Price
    * List of reviews
  * Grab images

### M2

Combine everything back
Save to persistent store (ETS?)

### M3

* Monitoring dash
* Priority queues per merhcants

### M4

* Breadcrumbs/categories
* Scrape more reviews
* Diff image sizes
