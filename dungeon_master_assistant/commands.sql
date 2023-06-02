-- LangChain x MindsDB Demo - Personal D&D assistant for the Dungeon Master!


-- #### STEP 1: data ####
-- Original .csv from Kaggle (kaggle.com/datasets/travistyler/dnd-5e-monster-manual-stats)
-- Note: if you would rather connect from a database, please ingest the .csv into it first, then connect the DB to MindsDB (check our docs for more details on that)
SELECT * FROM files.monsters;


-- #### STEP 2: Model creation ####
CREATE MODEL dungeon_assistant
PREDICT recommendation
USING
engine = 'langchain',
model_name='gpt-4',
tools=[], -- no tools other than internal mindsdb read access
verbose=True,  -- to see the chain in action through the logs
prompt_template='

You are a helpful Dungeons And Dragons (D&D) campaign assistant. 
Help the Dungeon Master (DM) find out the best monsters to use in a D&D campaign given what the DM is looking for. You should answer in a descriptive manner, worthy of a Dungeon Master that knows how to lead an awesome D&D game!

A helpful source on existing monsters is the `mariadb.monsters` MindsDB datasource, which you must use for creating all your recommendations. 

Remember these fundamental steps:
1. always start by checking the metadata of the `mariadb.monsters` table with the MDB-Metadata tool
2. always remember to check valid values for each field with a `SELECT DISTINCT` type of query before using them as a filter in a WHERE clause.
3. always limit search queries for relevant information to return at most five rows with `LIMIT 5`
4. if you get syntax errors when using the MindsDB tools, try with simpler SQL syntax, as it supports only a subset of standard SQL

Here is the DMs request: {{input}}. Remember to give a final answer with the valid parsing format that was defined above.
';


-- #### STEP 3: Model usage ####
SELECT input, recommendation
FROM dungeon_assistant
WHERE input = 'I have a campaign in a tropical jungle setting, with a group of level 7 and level 8 adventurers. Can you suggest monsters that would be appropriate to the setting, and moderately challenging for the adventurers?'
USING
max_iterations=20;
