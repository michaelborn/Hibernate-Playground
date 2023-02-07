# Hibernate Testing Playground

Speed test site for running various tests and logging the result. (Elapsed time.)

## Getting Started

After cloning this repo, start the server via CommandBox:

```bash
box server start
```

You can then browse to the test runner
([localhost:39143/all.cfm](http://localhost:39143/all.cfm)) which will run all
speed tests and log the results to `metrics-{VERSION}.csv`, where `{VERSION]` is the hibernate extension version. These results can then be compared against other extension versions in the other CSV files using Google Sheets.
