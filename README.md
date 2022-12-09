# S117 Senator Knowledge Graph

This repo contains the code we developed for building a knowledge graph that relates S117
senators to contributors, sentors to bills they voted on, sentors to recent twitter posts
they made during the month of November 2022, bills to named entities mentioned in their 
voter descriptions, and tweets to named entities mentioned in the tweet text. 
The file 'build_graph.ipynb' integrates all the data we collected an essentially builds
the Neo4j knowledge graph.  The other file, 'query_graph.ipynb' provide a multide of queries
we came up for querying our sentor knowledge graph.  Please add more queries if you think
of any!

DEPENDENCIES:

Must install Neo4j Desktop and configure the neo4j_import_dir in line 2 of build_graph.ipynb

pip install neo4j

Open Neo4j Desktop and run Graph DBMS

## Twitter Folder

This folder contains all the code and data used for building the tweet nodes in our knowledge graph
and also for building the named entity nodes of our graph.  Using the twitter IDs for each S117 senator,
we pulled 100 tweets from the month of November 2022 using the Twitter API for each senator.  We then
used Spacy (transformers implementation) to run a NER analysis on each tweet.  From there, we could
load tweets and name entities as individual nodes into our Neo4j graph and create and edge relating 
each tweet to the named entity.

## Rollcall Folder

This folder contains the S117 rollcalls file and an ipynb file for conducting a NER analysis on the 
roll call voter descriptions.  That is, we extracted named entities from the roll call descriptions
and then loaded those in as additional nodes to the Neo4j graph.  We then loaded in the roll calls
as individual nodes and related each roll call to a named entity mentioned in its voter description.

## Contributors Folder

This file contains data mapping donations from certain contributors to senators.  It also contains 
the code for processing contributions data and preparing for loading into Neo4j.  Essentially we 
loaded contributors as individual nodes to our knowledge graph and related them to senators then donated
to.  Each relationship of contributor to senator donation also include edge attributes such as amount,
pac, individual, and race.

## S117 Folder

This folder contains all the senate data from S117, including who the senators were and their features,
roll calls that came through the senate, and the senate voting results on all the roll calls.

## Graph Data Folder

The folder titled 'graph_data' contains all the data we ended up generatig for loading into our 
knowledge graph.  That is, all the processed tweets that map to named entities, all the processed
roll calls mapping the voter descriptions to named entities, all the processed contributions, all 
the processed senator voting results on roll calls, and all the process senator data including its 
mapping to twitter ID.  All of these data were loaded in using the build_graph.ipynb file to essentially
build our knowledge graph.

