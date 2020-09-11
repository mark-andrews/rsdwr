# Data wrangling and RMarkdown-based reproducible reports using R

In this two day course, we provide a practical introduction to data wrangling and RMarkdown based reproducible reports using R.
For the topic of data wrangling, we cover the `dplyr` tools such as `select`, `filter`, `mutate`, etc, the pipe operator (`%>%`) to create data wrangling pipelines, and how to perform descriptive or summary statistics using `dplyr`'s `summarize` and `group_by` functions, how to merge data frames, and how to pivot between wide and long data formats.
We then turn to the topic of writing reproducible data analysis reports using RMarkdown, knitr, and related tools.
These are vital tools for reproducible research that allow us to produce data analysis reports, i.e. articles, slides, posters, websites, etc., by embedding R analysis code within the text of the report that is then executed, and the results it produces are inserted into the final output document.
We will also mention some of the key additional tools that can used for reproducible research in R including Git, R packages, docker, and Make/Drake.

## Teaching Format

This course will be practical, hands-on, and workshop based. For some topics, there will a very minimal amount of lecture style presentations, i.e., using slides or blackboard, to introduce and explain key concepts and theories, but almost all of our time will be spent writing and executing R code. Almost all examples of code will be simple short one-liners of code. Any code that the instructor produces during these sessions will be uploaded to a publicly available GitHub site after each session. 
Any other materials, such as slides, data sets, etc., will be shared via GitHub.

The course will take place online using Zoom and each day will be divided into three equal length sessions. All sessions will be video recorded and made available to all attendees as soon as possible, hopefully soon after each session.

Although not strictly required, using a large monitor or preferably even a second monitor will make the learning experience better, as you will be able to see my RStudio and your own RStudio simultaneously.

## Assumed quantitative knowledge

We will assume familiarity with basic of statistical concepts, such as descriptive statistics. 

## Assumed computer background

Minimal prior experience with R and RStudio is required. Attendees should be familiar with some basic R syntax and commands, how to write code in the RStudio console and script editor, how to load up data from files, etc.

## Equipment and software requirements

Attendees of the course will need to use RStudio. Most people will want to use their own computer on which they install the RStudio desktop software. This can be done Macs, Windows, and Linux, though not on tablets or other mobile devices. Instructions on how to install and configure all the required software, which is all free and open source, will be provided before the start of the course. We will also provide time at the beginning of the workshops to ensure that all software is installed and configured properly. An alternative to using a local installation of RStudio is to use RStudio cloud (https://rstudio.cloud/). This is a free to use and full featured web based RStudio. It is not suitable for computationally intensive work but everything done in this class can be done using RStudio cloud.

Complete software instructions are [here](software.md).


# Course programme

## Day 1

* Topic 1: *Data wrangling*. We will begin by reading in data into R using tools such as `readr` and `readxl`. We will next cover the very powerful `dplyr` R package. This package supplies a number of so-called "verbs" --- `select`, `rename`, `slice`, `filter`, `mutate`, `arrange`, etc. --- each of which focuses on a key data manipulation tools, such as selecting or changing variables. All of these verbs can be chained together using "pipes" (represented by `%>%`). Together, these create powerful data wrangling pipelines that take raw data as input and return cleaned data as output. Here, we will also learn about the key concept of "tidy data", which is roughly where each row of a data frame is an observation and each column is a variable. We then cover summarizing data using `dplyr`'s `summarize` and `group_by` tools. We then cover `dplyr`'s SQL like "join" tools that allow us to merge multiple data frames that share key variables. Finally, we will cover "pivots". These methods allow us to convert between "wide" and "long" data formats.

## Day 2

* Topic 2: *Reproducible reports with RMarkdown*. RMarkdown is a file format that contains a mixture of R code and text and from which we can produce data analysis reports (or slides, web pages, etc). The report is produced by automatically executing all the analysis code in the RMarkdown file and inserting the results, such as tables, figures, etc., along with the text into the final pdf, html, or MS Word output document. We will cover the basics of RMarkdown, and in addition we will cover how to do mathematical typesetting with LaTeX; bibliography and citation management; cross references; formatting tables. We will primarily focus on creating articles as the output format, but will also show how to create web pages and slides.
* Topic 3: *Additional tools for reproducible data analysis in R*. In conclusion, we will briefly overview some of the key tools for doing reproducible research in R. These include Git and GitHub, R packages, Docker, and Make and Drake.

