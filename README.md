# S117 Senator Knowledge Graph

This repo contains the code we developed for building a knowledge graph that relates S117
senators to contributors, sentors to bills they voted on, sentors to recent twitter posts
they made during the month of November 2022, bills to named entities mentioned in their 
voter descriptions, tweets to named entities mentioned in the tweet text, and named entities
back to contributors. The file 'build_graph.ipynb' integrates all the data we collected an 
essentially builds the Neo4j knowledge graph.  The other file, 'query_graph.ipynb' provides a 
multide of queries we came up with for querying our sentor knowledge graph.  Please add more 
queries if you think of any!

## DEPENDENCIES:

(1) Install Neo4j Desktop

(2) MUST DO: Configure the neo4j_import_dir in line 2 of build_graph.ipynb to change it your local Neo4j dir, or else WILL NOT WORK

(3) pip install neo4j

(4) Open Neo4j Desktop and run Graph DBMS

## RUNNING:

Clone this repository and run the entire 'build_graph.ipynb' file to build the entire Neo4j senate graph.

## Twitter Folder

This folder contains all the code and data used for building the tweet nodes in our knowledge graph
and also for building the named entity nodes of our graph.  Using the twitter IDs for each S117 senator,
we pulled 100 tweets for each senator from the month of November 2022 using the Twitter API.  We then
used Spacy (transformers implementation) to run a NER analysis on each tweet.  From there, we could
load tweets and name entities as individual nodes into our Neo4j graph and create and edge relating 
each tweet to the named entity with an edge called MENTIONS.

## Rollcall Folder

This folder contains the S117 roll calls file and jupyter notebook for conducting a NER analysis on the 
roll call voter descriptions.  That is, we extracted named entities from the roll call descriptions
and then loaded those in as additional nodes to the Neo4j graph.  We then loaded in the roll calls
as individual nodes and related each roll call to a named entity mentioned in its voter description, using
the MENTIONS edge.

## Contributors Folder

This file contains data mapping donations from certain contributors to senators.  It also contains 
the code for processing contributions data and preparing for loading into Neo4j.  Essentially we 
loaded contributors as individual nodes to our knowledge graph and related them to senators they donated
to with a DONATED_TO edge.  Each relationship of contributor to senator donation also includes edge attributes 
such as amount, number of pacs, number of individual, and the race donated to.  Finally, we relate the
named entity nodes back to the contributor with a SAME_AS edge.

## S117 Folder

This folder contains all the senate data from S117, including who the senators were and their information
such as state and party, roll calls that came through the senate, and the senate voting results on all the 
roll calls.  The voting results file is what's used for linking senator nodes to roll calls, creating an 
edge VOTED_ON to denote what they voted for that roll call.  That edge has attributes such as 'yea' or 'nay'.  
Additionally, by linking senators to the twitter accounts and including the twitter account as a node
attribute, we linked senators to tweet nodes with a TWEETED edge

## Graph Data Folder

The folder titled 'graph_data' contains all the data we ended up generatig for loading into our 
knowledge graph.  That is, all the processed tweets that map to named entities, all the processed
roll calls mapping the voter descriptions to named entities, all the processed contributions, all 
the processed senator voting results on roll calls, all the matches between named entities and contributors,
and all the processed senator data including its mapping to twitter accounts.  All of these data were loaded in 
using the build_graph.ipynb file to essentially build our knowledge graph for which the query_graph.ipynb file 
can query from.

