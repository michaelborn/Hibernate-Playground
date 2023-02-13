# Hibernate Testing Playground

Speed test site for running various tests and logging the result. (Elapsed time.)

## Getting Started

After cloning this repo, start the server via CommandBox:

```bash
box server start
```

Next, generate test ORM entities by browsing to [localhost:39143/generate.cfm](http://localhost:39143/generate.cfm)

Finally, you can then browse to the test runner
([localhost:39143/all.cfm](http://localhost:39143/all.cfm)) which will run all
speed tests and log the results to `metrics-{VERSION}.csv`, where `{VERSION]` is the hibernate extension version. These results can then be compared against other extension versions in the other CSV files using Google Sheets.

## Results

Each performance run must be carefully generated using the following process:

1. Starting the server
2. Install the extension version (3.5, 5.4, modified 5.4)
3. Restarting the server
4. Browsing to metrics gatherer ([`all.cfm`](http://localhost:39143/all.cfm)) *without hitting any other page*

This ensures a more consistent result.

See [Lucee Hibernate Speed Tests on Google Sheets](https://docs.google.com/spreadsheets/d/1Uvt66KngKuGV2VQGbP5kfMIiZHilAAPdWoOL1fZAX6o/edit?usp=sharing) to view the current data.

## Contributing

I would love help with:

1. Automating the testing / data gathering process.
   1. i.e. Automate extension installation and metrics runner described in [Results](#results)
2. Adding more performance tests